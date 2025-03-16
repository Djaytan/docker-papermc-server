#!/usr/bin/env bash

set -Eeuo pipefail

# OCI properties
IMAGE_SIMPLE_NAME='papermc-server'
IMAGE_TAG='latest'
IMAGE_FULL_NAME="${IMAGE_SIMPLE_NAME}:${IMAGE_TAG}"

docker run --rm -it -p 25565:25565/tcp -p 25565:25565/udp -e EULA=false "${IMAGE_FULL_NAME}"
