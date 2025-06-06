#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

cd "${SCRIPT_DIR}"

echo '🏗️ Building the DEV image...'
docker buildx bake dev --print
docker buildx bake --progress=plain dev
echo '✅  Image built successfully.'
