#!/usr/bin/env bash
# Reference: https://docs.papermc.io/misc/downloads-api

# renovate: datasource=papermc
MINECRAFT_VERSION='1.21.3'

LATEST_BUILD=$(curl -sSf "https://api.papermc.io/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds" | \
    jq -r '.builds | map(select(.channel == "default") | .build) | .[-1]')

if [ "$LATEST_BUILD" != "null" ]; then
    # Download the latest PaperMC server version
    JAR_NAME=paper-${MINECRAFT_VERSION}-${LATEST_BUILD}.jar
    curl -sSf "https://api.papermc.io/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds/${LATEST_BUILD}/downloads/${JAR_NAME}" \
        --output "papermc-server-${MINECRAFT_VERSION}-${LATEST_BUILD}.jar"
    echo "Downloaded PaperMC server v${MINECRAFT_VERSION} (build #${LATEST_BUILD})"
else
    echo "No stable build for version $MINECRAFT_VERSION found :("
fi
