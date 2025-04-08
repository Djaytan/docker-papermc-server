# ========== VARIABLES ========== #

# General properties
variable "REGISTRY" {
  default = ""
}
variable "IMAGE_NAME" {
  # TODO: make organization configurable
  default = "djaytan/papermc-server"
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
  default = "1.21.4"
}
variable "IMAGE_VERSION" {
  default = "0.0.0"
}

# ========== FUNCTIONS ========== #

function "tag" {
  params = [tag]
  result = "${notequal(REGISTRY, "") ? "${REGISTRY}/" : ""}${IMAGE_NAME}:${tag}"
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

target "dev" {
  description = "Builds the image for development purposes."
  args = {
    MINECRAFT_VERSION = "${MINECRAFT_VERSION}"
  }
  tags = [
    tag("dev")
  ]
}

target "release" {
  description = "Builds the image for production purposes."
  args = {
    MINECRAFT_VERSION = "${MINECRAFT_VERSION}"
  }
  platforms = ["linux/amd64", "linux/arm64"]
  pull = true
  no-cache = true
  # Docker tag format: <mc-version>-v<image-version>-<timestamp-YYYYMMDD>
  tags = [
    equal(IS_LATEST_RELEASE, true) ? tag("latest") : "", # Optional latest tag (empty string = no tag)
    tag("${MINECRAFT_VERSION}"), # TODO: fix => only publish if latest release OR always consider latest release
    tag("${MINECRAFT_VERSION}-v${IMAGE_VERSION}"),
    tag("${MINECRAFT_VERSION}-v${IMAGE_VERSION}-${date()}"),
    tag("${MINECRAFT_VERSION}-v${extractMajorMinorFromSemVer(IMAGE_VERSION)}"),
    tag("${MINECRAFT_VERSION}-v${extractMajorFromSemVer(IMAGE_VERSION)}")
  ]
  annotations = [
    "org.opencontainers.image.title=PaperMC Server",
    "org.opencontainers.image.description=Dockerized and fine-grained customizable PaperMC server.",
    "org.opencontainers.image.version=${MINECRAFT_VERSION}-v${IMAGE_VERSION}-${date()}",
    "org.opencontainers.image.url=https://github.com/Djaytan/docker-papermc-server",
    "org.opencontainers.image.documentation=https://github.com/Djaytan/docker-papermc-server",
    "org.opencontainers.image.source=https://github.com/Djaytan/docker-papermc-server.git",
    "org.opencontainers.image.authors=Djaytan <https://github.com/Djaytan>",
    "org.opencontainers.image.vendor=Djaytan",
    "org.opencontainers.image.licenses=GPL-3.0-or-later",
    "org.opencontainers.image.created=${formatdate("YYYY-MM-DD'T'hh:mm:ss'Z'", timestamp())}",
    "${notequal(REVISION, "") ? "org.opencontainers.image.revision=${REVISION}" : ""}"
  ]
}
