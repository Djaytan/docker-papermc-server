#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

bash "$SCRIPT_DIR"/build-dev.sh

echo '▶️ Starting the localdev PaperMC server...'
# TODO: migrate to Docker compose?
docker run --rm -it -p 25565:25565/tcp -p 25565:25565/udp -e EULA=true 'djaytan/papermc-server:dev'
echo '🛑 The localdev PaperMC server has been stopped and removed.'
