# ========== VARIABLES ========== #

# General properties
variable "REGISTRY" {
  default = ""
}
variable "IMAGE_NAME" {
  # TODO: make organization configurable
  default = "djaytan/papermc-server"
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
  default = "$IMAGE_VERSION"
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
    tag("${MINECRAFT_VERSION}"),
    tag("${MINECRAFT_VERSION}-v${IMAGE_VERSION}"),
    tag("${MINECRAFT_VERSION}-v${IMAGE_VERSION}-${date()}"),
    tag("${MINECRAFT_VERSION}-v${extractMajorMinorFromSemVer(IMAGE_VERSION)}"),
    tag("${MINECRAFT_VERSION}-v${extractMajorFromSemVer(IMAGE_VERSION)}")
  ]
  # TODO: annotations => https://github.com/opencontainers/image-spec/blob/main/annotations.md (or at Dockerfile level maybe?)
  # TODO: what about labels?
}
