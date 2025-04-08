#!/usr/bin/env bash
# Assumption: The OCI image is already built and tagged as 'djaytan/papermc-server:dev'

set -Eeuo pipefail

CONTAINER_NAME='test-papermc-server'

echo '📋 Testing the Docker PaperMC server image...'

echo '▶️ Starting the PaperMC server in background...'
docker run --rm -d --name "$CONTAINER_NAME" -e EULA=true 'djaytan/papermc-server:dev'

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
  if [[ $ELAPSED_TIME -gt 60 ]]; then
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
