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

echo '⚙️ Preparing PaperMC server configuration files...'

TMP="$(envsubst '$EULA' < eula.txt)"
echo "${TMP}" > eula.txt
echo '🧾 File eula.txt processed'

# TODO: support help.yml
# TODO: support ops.json
# TODO: support whitelist.json
# TODO: disable permissions.yml?
# TODO: support custom Spark plugin version
# TODO: Ensure Timings v2 is disabled by default
# TODO: add tests verifying properties are well customized as expected

generateConfig() {
  config_name="$1"
  target_path="$2"
  envvar_prefix="$3"
  expression="$4"

  envvar="$(env | grep -E "^${envvar_prefix}" | tr '\n' ',' | head -c -1)"
  cue_file="cue/${config_name}.cue"
  yaml_file="${config_name}.yml"

  echo "📝 Generating configuration file \"${yaml_file}\"..."

  # Validate user-provided configuration property values
  cue vet "$cue_file" --concrete

  # Generate the configuration file
  cue export "$cue_file" --inject "${envvar}" -e "${expression}" --out yaml --outfile "${target_path}/${yaml_file}"
}

mkdir config/

# Bukkit
generateConfig 'bukkit' '.' 'BUKKIT_GLOBAL_' 'bukkit'
generateConfig 'commands' 'config' 'BUKKIT_COMMANDS_' 'bukkit.commands'
generateConfig 'permissions' 'config' 'BUKKIT_PERMISSIONS_' 'bukkit.permissions'

# Spigot
generateConfig 'spigot' 'config' 'SPIGOT_' 'spigot'

# Paper
generateConfig 'paper-global' 'config' 'PAPER_GLOBAL_' 'paper'
generateConfig 'paper-world-defaults' 'config' 'PAPER_WORLD_DEFAULTS_' 'paper["worlds-defaults"]'

# Clean-up CUE files after config generation
rm -rf cue/

echo 'PaperMC server ready to start!'

exec java $JVM_ARGUMENTS -jar "${SCRIPT_DIR}"/papermc-server-*.jar $SERVER_ARGS
