#!/usr/bin/env sh
# This script aims to wrap pip-tools through Docker in order to ensure portability across systems (Windows, Linux, Mac)

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

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
    # We manually enforce a Windows path to prevent issues with Docker volume mounts
    SCRIPT_DIR="$(cygpath --windows "${SCRIPT_DIR}")"
    ;;
esac

docker build -t pip-tools -f Dockerfile.pip-tools "${SCRIPT_DIR}"

echo 'Compile the requirements.txt file using pip-tools...'

docker run --rm --name pip-tools \
  --volume="${SCRIPT_DIR}:/run" \
  --workdir /run \
  pip-tools \
  pip-compile --strip-extras --generate-hashes
