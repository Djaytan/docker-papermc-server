#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(dirname "$0")

sh "${SCRIPT_DIR}"/build-dev.sh

echo '🚀 Starting the localdev PaperMC server...'

# Simulate a production-like environment by enforcing strict security policies:
# - Drop all Linux capabilities (PaperMC does not require any).
# - Disable privilege escalation within the container.
docker run --rm -it \
  --name localdev-papermc-server \
  --cap-drop all \
  --security-opt no-new-privileges \
  --memory=8GB \
  -p 25565:25565 \
  -e EULA=true \
  -e BUKKIT_GLOBAL_SETTINGS_ALLOW_END=false \
  'djaytan/papermc-server:dev'

echo '🛑 The localdev PaperMC server has been stopped and removed.'
