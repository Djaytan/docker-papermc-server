#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

## Directories
CONFIG_DIR="${SCRIPT_DIR}/config"
WORLD_DIR="${SCRIPT_DIR}/worlds"

## Server file
SERVER_FILE_NAME='papermc-server-1.21.4-211.jar'
SERVER_FILE="${SCRIPT_DIR}/${SERVER_FILE_NAME}"

## JVM arguments
# server.properties: https://minecraft.wiki/w/Server.properties
# bukkit.yml: https://bukkit.fandom.com/wiki/Bukkit.yml
# spigot.yml: https://www.spigotmc.org/wiki/spigot-configuration/
# Paper config: https://docs.papermc.io/paper/reference/global-configuration
# Aïkar's flags: https://docs.papermc.io/paper/aikars-flags
# Paper system properties: https://docs.papermc.io/paper/reference/system-properties
HEAP_SIZE=4
AIKAR_FLAGS=(
  -Xms"${HEAP_SIZE}"G
  -Xmx"${HEAP_SIZE}"G
  -XX:+AlwaysPreTouch
  -XX:+DisableExplicitGC
  -XX:+ParallelRefProcEnabled
  -XX:+PerfDisableSharedMem
  -XX:+UnlockExperimentalVMOptions
  -XX:+UseG1GC
  -XX:G1HeapRegionSize=8M
  -XX:G1HeapWastePercent=5
  -XX:G1MaxNewSizePercent=40
  -XX:G1MixedGCCountTarget=4
  -XX:G1MixedGCLiveThresholdPercent=90
  -XX:G1NewSizePercent=30
  -XX:G1RSetUpdatingPauseTimePercent=5
  -XX:G1ReservePercent=20
  -XX:InitiatingHeapOccupancyPercent=15
  -XX:MaxGCPauseMillis=200
  -XX:MaxTenuringThreshold=1
  -XX:SurvivorRatio=32
  -Dusing.aikars.flags=https://mcflags.emc.gs
  -Daikars.new.flags=true
)
PAPER_FLAGS=(
  -Dnet.kyori.adventure.text.warnWhenLegacyFormattingDetected
  -Dpaper.ticklist-warn-on-excessive-delay
  -Dpaper.strict-thread-checks
  -DPaper.skipServerPropertiesComments
  -Dpaper.alwaysPrintWarningState
)
JVM_ARGUMENTS=("${AIKAR_FLAGS[@]}" "${SPIGOT_FLAGS[@]}" "${PAPER_FLAGS[@]}")

## Server arguments
# Spigot start-up parameters: https://www.spigotmc.org/wiki/start-up-parameters/
SERVER_ARGS=(
  --spigot-settings "${CONFIG_DIR}/spigot.yml"
  --commands-settings "${CONFIG_DIR}/commands.yml"
  --world-dir "${WORLD_DIR}"
  --log-strip-color
  --nogui
)

cd "${SCRIPT_DIR}"
java "${JVM_ARGUMENTS[@]}" -jar "${SERVER_FILE}" "${SERVER_ARGS[@]}"
