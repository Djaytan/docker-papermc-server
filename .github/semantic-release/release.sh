#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

RELEASE_VERSION=$1
RELEASE_CHANNEL=${2:-'default'}

export REGISTRY='docker.io'
export BUILD_CONTEXT="$SCRIPT_DIR"
export IMAGE_VERSION="$RELEASE_VERSION"

# The default channel binds to the default Git branch (i.e. "main")
# If we release from "main" branch -> we add the "latest" tag
IS_LATEST_RELEASE="$([ "$RELEASE_CHANNEL" == 'default' ] && echo 'true' || echo 'false')"
export IS_LATEST_RELEASE

if [[ -z "$ROOT_PROJECT_DIR" ]]; then
  echo 'Error: environment variable "ROOT_PROJECT_DIR" is not set.'
  exit 1
fi

cd "$ROOT_PROJECT_DIR/src"

docker buildx bake release --print
docker buildx bake release --push
