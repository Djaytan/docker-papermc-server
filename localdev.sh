#!/usr/bin/env sh
# TODO: OWASP RULE#4 https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html#rule-4-prevent-in-container-privilege-escalation
# TODO: OWASP RULE#7 https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html#rule-7-limit-resources-memory-cpu-file-descriptors-processes-restarts
# TODO: Same OWASP rules in test.sh file
# TODO: document security recommendations adapted to this project
# TODO: document requirements for OWASP RULE#8 https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html#rule-7-limit-resources-memory-cpu-file-descriptors-processes-restarts
# TODO: try OWASP RULE#8 here
# TODO: move at root of the project

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

cd "${SCRIPT_DIR}/src/main/docker"

echo '🏗️ Building the DEV image...'
docker buildx bake dev --print
docker buildx bake --progress=plain dev
echo '✅  Image built successfully.'

echo '▶️ Starting the localdev PaperMC server...'

docker run --rm -it \
  --cap-drop all \
  -p 25565:25565/tcp -p 25565:25565/udp \
  -e EULA=true \
  'djaytan/papermc-server:dev'

echo '🛑 The localdev PaperMC server has been stopped and removed.'
