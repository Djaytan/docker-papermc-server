#!/usr/bin/env bash

set -Eeuo pipefail

NEXT_RELEASE_VERSION=$1
NEXT_RELEASE_CHANNEL=${2:-default}

# Extract <major>.<minor> part of the SemVer version
NEXT_RELEASE_MAJOR_MINOR_VERSION="${NEXT_RELEASE_VERSION%".${NEXT_RELEASE_VERSION#*.*.}"}"
# Extract <major> part of the SemVer version
NEXT_RELEASE_MAJOR_VERSION="${NEXT_RELEASE_MAJOR_MINOR_VERSION%.*}"

# renovate: datasource=papermc
MINECRAFT_VERSION='1.21.4'

IMAGE_NAME=djaytan/papermc-server
IMAGE_BUILD_CONTEXT_DIR="$ROOT_PROJECT_DIR/src"

docker build --platform=linux/amd64,linux/arm64 --tag "$IMAGE_NAME" "$IMAGE_BUILD_CONTEXT_DIR"

# Docker tag format: <mc-version>-v<image-version>-<timestamp-YYYYMMDD>
docker tag "$IMAGE_NAME" "$IMAGE_NAME:$MINECRAFT_VERSION"
docker tag "$IMAGE_NAME" "$IMAGE_NAME:$MINECRAFT_VERSION-v$NEXT_RELEASE_VERSION"
docker tag "$IMAGE_NAME" "$IMAGE_NAME:$MINECRAFT_VERSION-v$NEXT_RELEASE_MAJOR_MINOR_VERSION"
docker tag "$IMAGE_NAME" "$IMAGE_NAME:$MINECRAFT_VERSION-v$NEXT_RELEASE_MAJOR_VERSION"
docker tag "$IMAGE_NAME" "$IMAGE_NAME:$MINECRAFT_VERSION-v$NEXT_RELEASE_VERSION-$(date +%Y%m%d)"

# The default channel binds to the default Git branch (i.e. "main")
# If we release from "main" branch -> we add the "latest" tag
if [[ "$NEXT_RELEASE_CHANNEL" == 'default' ]]; then
  docker tag "$IMAGE_NAME" "$IMAGE_NAME:latest"
fi

docker push --all-tags "$IMAGE_NAME"
