#!/usr/bin/env bash
# This script aims to wrap pip-tools through Docker in order to ensure portability across systems (Windows, Linux, Mac)

set -eu

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# Path conversion is required on Windows so that Docker volume mount will work
# However, it shall be done in a controlled manner to avoid issues
# Using Cygwin effectively with Windows: https://cygwin.com/cygwin-ug-net/using-effectively.html
# Kernel detection is done based on the recommendation found here: https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
if [[ "$(uname)" =~ (CYGWIN.*)|(MINGW.*)|(MSYS.*) ]]; then
  # We disable automatic path conversion to avoid unexpected side effects
  export MSYS_NO_PATHCONV=1
  # We manually enforce a Windows path to prevent issues with Docker volume mounts
  SCRIPT_DIR="$(cygpath --windows "${SCRIPT_DIR}")"
fi

docker build -t pip-tools -f Dockerfile.pip-tools "${SCRIPT_DIR}"

echo 'Compile the requirements.txt file using pip-tools...'

docker run --rm --name pip-tools \
  --volume="${SCRIPT_DIR}:/run" \
  --workdir /run \
  pip-tools \
  pip-compile --strip-extras --generate-hashes
