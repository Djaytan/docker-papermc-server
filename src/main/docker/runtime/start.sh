#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

## Directories
CONFIG_DIR="${SCRIPT_DIR}/config"
WORLD_DIR="${SCRIPT_DIR}/worlds"

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
  --world-dir ${WORLD_DIR}
  --log-strip-color
  --nogui
"
# TODO: document internal directory layout (particularly important since non-standard)

cd "${SCRIPT_DIR}"

echo 'Preparing PaperMC server configuration files...'

TMP="$(envsubst '$EULA' < eula.txt)"
echo "${TMP}" > eula.txt
echo 'File eula.txt processed'

# TODO: simplify with CUE packages?

ENVVAR="$(env | grep -E '^(BUKKIT|SPIGOT|PAPER)_' | tr '\n' ',' | head -c -1)"

# Generate bukkit.yml configuration file
cue vet bukkit.cue --concrete --inject "${ENVVAR}"
cue export bukkit.cue --inject "${ENVVAR}" --out yaml --outfile bukkit.yml

cd "${SCRIPT_DIR}/config"

# Generate Spigot and PaperMC configuration files
for cue_file in *.cue; do
  cue vet "$cue_file" --concrete
  cue export "$cue_file" --out yaml --outfile "${cue_file%.cue}.yml"
done

cd "${SCRIPT_DIR}"

echo 'PaperMC server ready to start!'

exec java $JVM_ARGUMENTS -jar "${SCRIPT_DIR}"/papermc-server-*.jar $SERVER_ARGS
