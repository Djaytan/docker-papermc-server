#!/usr/bin/env sh
# This script aims to wrap pip-compile through Docker in order to ensure portability across systems (Windows, Linux, Mac)

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)
CURRENT_DIR=$(pwd -P)

# On Windows environments (Cygwin, MinGW, MSYS), Docker volume mounts require Windows-style paths.
# However, automatic path conversion by MSYS can cause unexpected issues,
# so we disable it and convert paths explicitly and deliberately.
# See: https://cygwin.com/cygwin-ug-net/using-effectively.html
# Kernel detection approach based on recommendations from:
# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
case "$(uname)" in
  CYGWIN*|MINGW*|MSYS*)
    # We disable automatic path conversion to avoid unexpected side effects
    export MSYS_NO_PATHCONV=1
    # We manually enforce a Windows path to prevent issues with Docker
    SCRIPT_DIR="$(cygpath --windows "${SCRIPT_DIR}")"
    CURRENT_DIR="$(cygpath --windows "${CURRENT_DIR}")"
    ;;
esac

echo 'Building Docker image for pip-tools (should only take few seconds)'
docker build --progress quiet \
  --build-arg "UID=$(id -u)" \
  --build-arg "GID=$(id -g)" \
  -t docker-papermc-server/pip-tools \
  "${SCRIPT_DIR}"

echo
echo 'Running pip-compile:'
docker run --rm --name docker-papermc-server-pip-compile \
  --volume="${CURRENT_DIR}:/run" \
  --workdir /run \
  docker-papermc-server/pip-tools \
  pip-compile --strip-extras "$@"
