#!/usr/bin/env sh
# Assumption: The OCI image is already built and tagged as 'djaytan/papermc-server:dev'

set -eu

CONTAINER_NAME='test-papermc-server'

echo '📋 Testing the Docker PaperMC server image...'

echo '▶️ Starting the PaperMC server in background...'

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
docker run --rm -d --name "$CONTAINER_NAME" \
  --cap-drop all \
  --security-opt no-new-privileges \
  --ulimit nofile=16384 \
  --ulimit nproc=4096 \
  --ulimit core=0 \
  --cpus=4 \
  --memory=8GB \
  -p 25565:25565 \
  -e EULA=true \
  'djaytan/papermc-server:dev'

cleanup() {
    echo '🛑 Automatically stopping and removing the PaperMC server container...'
    # Stopped container is automatically removed afterward
    docker stop "$CONTAINER_NAME" > /dev/null 2>&1
}

# Trap to ensure cleanup on script exit
trap cleanup EXIT

START_TIME=$(date +%s)
SUCCESS_LOG_PATTERN='Done \(.*s\)! For help, type "help"'

# Monitor logs
echo '⌛  Waiting for server to start...'
docker ps

while true; do
  docker logs --since 5s "$CONTAINER_NAME"

  CURRENT_TIME=$(date +%s)
  ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

  # Check if timeout of 60 seconds has been reached
  if [ $ELAPSED_TIME -gt 60 ]; then
    echo "❌  Server failed to start within 60 seconds."
    exit 1
  fi

  # Check logs for success pattern
  if docker logs "$CONTAINER_NAME" 2>&1 | grep -qE "$SUCCESS_LOG_PATTERN"; then
    echo "✅  Server started successfully."
    break
  fi

  sleep 5
done
