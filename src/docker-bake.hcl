########################################
#    Multi-target Docker image build   #
########################################

# This file defines multiple build targets using Docker Bake,
# allowing for fine-grained control over how images are built,
# tagged, and promoted across environments (dev, test, release, etc.).

# ─────────────────────────────────────
# 🏗️ Image Targets
# ─────────────────────────────────────
# dev:
#   Lightweight image for development and local testing.
#   Uses a single architecture and avoids production overhead.

# test:
#   Image used for automated testing pipelines.
#   Always pulls latest base layers to validate rebuild reliability.

# release:
#   Final production image, tagged for distribution.
#   Uses full multi-arch build, add annotations, disables cache, and
#   assigns versioned + semantic tags (e.g., latest, major, minor,
#   timestamp).

# ─────────────────────────────────────
# 💡 Usage Notes
# ─────────────────────────────────────
# - Use `dev` when iterating locally.
# - Use `test` in CI pipelines to verify integrity.
# - Use `release` only in actual publishing pipelines.

# Build with:
#   docker buildx bake <target>
#
# Example:
#   docker buildx bake dev

# ========== VARIABLES ========== #

# General properties
variable "REGISTRY" {
  default = ""
}
variable "ORGANIZATION" {
  default = "djaytan"
}
variable "IMAGE_NAME" {
  default = "papermc-server"
}
variable "REVISION" {
  default = ""
}

# Tags properties
variable "IS_LATEST_RELEASE" {
  default = false
}
# renovate: datasource=papermc
variable "MINECRAFT_VERSION" {
  default = "1.21.10"
}
variable "IMAGE_VERSION" {
  default = "0.0.0"
}

# ========== FUNCTIONS ========== #

function "tag" {
  params = [tag]
  result = "${notequal(REGISTRY, "") ? "${REGISTRY}/" : ""}${ORGANIZATION}/${IMAGE_NAME}:${tag}"
}

function "annotation" {
  params = [key, value]
  result = "index,manifest:${key}=${value}"
}

function "extractMajorFromSemVer" {
  params = [semver]
  result = split(".", semver)[0]
}

function "extractMajorMinorFromSemVer" {
  params = [semver]
  result = "${split(".", semver)[0]}.${split(".", semver)[1]}"
}

function "date" {
  params = []
  result = formatdate("YYYYMMDD", timestamp())
}

# ========== TARGETS ========== #

target "_common" {
  description = "Base configuration inherited by all other targets."
  args = {
    MINECRAFT_VERSION = "${MINECRAFT_VERSION}"
  }
}

target "dev" {
  inherits = ["_common"]
  description = "Builds a lightweight image for development and local testing."
  tags = [ tag("dev") ]
}

target "test" {
  inherits = ["_common"]
  description = "Builds a test image with fresh base layers (always pulls upstream images)."
  pull = true
  tags = [ tag("test") ]
}

target "release" {
  inherits = ["_common"]
  description = "Builds and tags the production image for publishing."
  platforms = ["linux/amd64", "linux/arm64"]
  pull = true
  no-cache = true
  annotations = [
    annotation("org.opencontainers.image.title", "PaperMC Server"),
    annotation("org.opencontainers.image.description", "Dockerized and fine-grained customizable PaperMC server."),
    annotation("org.opencontainers.image.version", "${MINECRAFT_VERSION}-v${IMAGE_VERSION}-${date()}"),
    annotation("org.opencontainers.image.url", "https://github.com/Djaytan/docker-papermc-server"),
    annotation("org.opencontainers.image.documentation", "https://github.com/Djaytan/docker-papermc-server"),
    annotation("org.opencontainers.image.source", "https://github.com/Djaytan/docker-papermc-server.git"),
    annotation("org.opencontainers.image.authors", "Djaytan <https://github.com/Djaytan>"),
    annotation("org.opencontainers.image.vendor", "Djaytan"),
    annotation("org.opencontainers.image.licenses", "GPL-3.0-or-later"),
    annotation("org.opencontainers.image.created", "${formatdate("YYYY-MM-DD'T'hh:mm:ss'Z'", timestamp())}"),
    notequal(REVISION, "") ? annotation("org.opencontainers.image.revision", REVISION) : ""
  ]
  attest = [
    { type = "provenance", mode = "max", },
    { type = "sbom", }
  ]
  tags = [
    equal(IS_LATEST_RELEASE, true) ? tag("latest") : "",
    equal(IS_LATEST_RELEASE, true) ? tag("${MINECRAFT_VERSION}") : "",
    tag("${MINECRAFT_VERSION}-v${IMAGE_VERSION}"),
    tag("${MINECRAFT_VERSION}-v${IMAGE_VERSION}-${date()}"),
    tag("${MINECRAFT_VERSION}-v${extractMajorMinorFromSemVer(IMAGE_VERSION)}"),
    tag("${MINECRAFT_VERSION}-v${extractMajorFromSemVer(IMAGE_VERSION)}")
  ]
}
