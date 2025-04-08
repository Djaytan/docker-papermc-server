#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

cd "${SCRIPT_DIR}/../main"

echo '🏗️ Building the DEV image...'
docker buildx bake dev --print
docker buildx bake dev
echo '✅  Image built successfully.'

echo '▶️ Starting the localdev PaperMC server...'
docker run --rm -it -p 25565:25565/tcp -p 25565:25565/udp -e EULA=true 'djaytan/papermc-server:dev'
echo '🛑 The localdev PaperMC server has been stopped and removed.'
