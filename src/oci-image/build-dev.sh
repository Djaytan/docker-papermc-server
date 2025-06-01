#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(dirname "$0")

cd "${SCRIPT_DIR}"

echo '🏗️ Building the DEV image...'
docker buildx bake dev --print
docker buildx bake --progress=plain dev
echo '✅  Image built successfully.'
