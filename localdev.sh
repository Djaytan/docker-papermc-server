#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

cd "${SCRIPT_DIR}/src/main/docker"

echo '🏗️ Building the DEV image...'
docker buildx bake dev --print
docker buildx bake --progress=plain dev
echo '✅  Image built successfully.'

echo '▶️ Starting the localdev PaperMC server...'

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
  'djaytan/papermc-server:dev'

echo '🛑 The localdev PaperMC server has been stopped and removed.'
