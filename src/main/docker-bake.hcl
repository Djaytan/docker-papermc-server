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
  default = "1.21.4"
}
variable "IMAGE_VERSION" {
  default = "0.0.0"
}

# TODO: customizable annotations (url, documentation, source, authors, vendor, ...)

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
    equal(IS_LATEST_RELEASE, true) ? tag("latest") : "",
    equal(IS_LATEST_RELEASE, true) ? tag("${MINECRAFT_VERSION}") : "",
    tag("${MINECRAFT_VERSION}-v${IMAGE_VERSION}"),
    tag("${MINECRAFT_VERSION}-v${IMAGE_VERSION}-${date()}"),
    tag("${MINECRAFT_VERSION}-v${extractMajorMinorFromSemVer(IMAGE_VERSION)}"),
    tag("${MINECRAFT_VERSION}-v${extractMajorFromSemVer(IMAGE_VERSION)}")
  ]
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
}
