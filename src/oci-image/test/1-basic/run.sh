#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(dirname "$0")

DOCKER_COMPOSE_FILE="${SCRIPT_DIR}/../docker-compose.yml"
CONTAINER_NAME='test-papermc-server'

echo '📋 Testing the Docker PaperMC server image...'

echo '▶️ Starting the PaperMC server in background...'

cd "${SCRIPT_DIR}"
docker compose -f "${DOCKER_COMPOSE_FILE}" up -d

cleanup() {
    echo '🛑 Automatically stopping and removing the PaperMC server container...'
    # Stopped container is automatically removed afterward
    docker compose -f "${DOCKER_COMPOSE_FILE}" down
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
