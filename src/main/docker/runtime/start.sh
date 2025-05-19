#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

## Directories
CONFIG_DIR="${SCRIPT_DIR}/config"

## JVM arguments
# server.properties: https://minecraft.wiki/w/Server.properties
# bukkit.yml: https://bukkit.fandom.com/wiki/Bukkit.yml
# spigot.yml: https://www.spigotmc.org/wiki/spigot-configuration/
# Paper config: https://docs.papermc.io/paper/reference/global-configuration
# Aïkar's flags: https://docs.papermc.io/paper/aikars-flags
# Paper system properties: https://docs.papermc.io/paper/reference/system-properties
AIKAR_FLAGS="
  -Xms4G
  -Xmx4G
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
"
PAPER_FLAGS='
  -Dnet.kyori.adventure.text.warnWhenLegacyFormattingDetected
  -Dpaper.ticklist-warn-on-excessive-delay
  -Dpaper.strict-thread-checks
  -DPaper.skipServerPropertiesComments
  -Dpaper.alwaysPrintWarningState
'

# Combine all JVM arguments into a single string
JVM_ARGUMENTS="${AIKAR_FLAGS} ${PAPER_FLAGS}"

## Server arguments
# Spigot start-up parameters: https://www.spigotmc.org/wiki/start-up-parameters/
SERVER_ARGS="
  --spigot-settings ${CONFIG_DIR}/spigot.yml
  --commands-settings ${CONFIG_DIR}/commands.yml
  --log-strip-color
  --nogui
"
# TODO: document internal directory layout (particularly important since non-standard)

cd "${SCRIPT_DIR}"

echo 'Preparing PaperMC server configuration files...'

TMP="$(envsubst '$EULA' < eula.txt)"
echo "${TMP}" > eula.txt
echo 'File eula.txt processed'

# TODO: support help.yml
# TODO: support ops.json
# TODO: support whitelist.json
# TODO: disable permissions.yml?
# TODO: support custom Spark plugin version
# TODO: Ensuire Timings v2 is disabled by default

ENVVAR="$(env | grep -E '^(BUKKIT|SPIGOT|PAPER)_' | tr '\n' ',' | head -c -1)"

generateConfig() {
  config_file="$1"
  cue_file="${config_file%.yml}.cue"

  # Validate user-provided configuration property values
  cue vet "$cue_file" --concrete

  # Generate the configuration file
  cue export "$cue_file" --inject "${ENVVAR}" --out yaml --outfile "$config_file"
}

# Bukkit
generateConfig 'bukkit.yml'
generateConfig 'config/commands.yml'
generateConfig 'config/permissions.yml'

# Spigot
generateConfig 'config/spigot.yml'

# Paper
generateConfig 'config/paper-global.yml'
generateConfig 'config/paper-world-defaults.yml'

# Clean-up CUE files after config generation
find . -type f -name '*.cue' -exec rm -f {} +

echo 'PaperMC server ready to start!'

exec java $JVM_ARGUMENTS -jar "${SCRIPT_DIR}"/papermc-server-*.jar $SERVER_ARGS
