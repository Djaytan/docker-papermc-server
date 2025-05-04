#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

cd "${SCRIPT_DIR}/src/main/docker"

echo '🏗️ Building the DEV image...'
docker buildx bake dev --print
docker buildx bake --progress=plain dev
echo '✅  Image built successfully.'

echo '▶️ Starting the localdev PaperMC server...'

# Apply security best practices based on OWASP recommendations:
# https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html
#
# Simulate a production-like environment by enforcing strict security policies:
# - Drop all Linux capabilities (PaperMC does not require any).
# - Disable privilege escalation within the container.
# - Set ulimits:
#     - `nofile` (open files): 16384 — sufficient for typical Java-based Minecraft servers.
#     - `nproc` (processes): 4096 — a safe and generous limit for JVM workloads.
#     - `core`: 0 — disables core dumps to preserve disk space and avoid leaking sensitive information.
docker run --rm -it \
  --name localdev-papermc-server \
  --cap-drop all \
  --security-opt no-new-privileges \
  --ulimit nofile=16384 \
  --ulimit nproc=4096 \
  --ulimit core=0 \
  --cpus=4 \
  --memory=8GB \
  -p 25565:25565/tcp -p 25565:25565/udp \
  -e EULA=true \
  'djaytan/papermc-server:dev'

echo '🛑 The localdev PaperMC server has been stopped and removed.'
