#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

cd "${SCRIPT_DIR}/../main"

echo '🏗️ Building the DEV image...'

docker buildx bake dev --print
docker buildx bake dev --load

echo "✅  Image built successfully."
