#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

export BUILD_CONTEXT="${SCRIPT_DIR}"
export IMAGE_VERSION="0.0.0-DEV" # Useless, but required

docker buildx bake dev --print
docker buildx bake dev --progress=plain

# TODO: migrate to Docker compose
docker run --rm -it -p 25565:25565/tcp -p 25565:25565/udp -e EULA=true djaytan/papermc-server:dev
