#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# OCI properties
BUILD_CONTEXT_DIR="${SCRIPT_DIR}"
IMAGE_SIMPLE_NAME='papermc-server'
IMAGE_TAG='latest'
IMAGE_FULL_NAME="${IMAGE_SIMPLE_NAME}:${IMAGE_TAG}"

docker build --tag "${IMAGE_FULL_NAME}" "${BUILD_CONTEXT_DIR}"
