#!/usr/bin/env bash
# This script aims to wrap Markdown Material CLI through Docker in order to ensure portability across systems (Windows, Linux, Mac)

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

echo 'The preview is going to be available at http://localhost:8000/docker-papermc-server/'

docker run --rm -it -p 8000:8000 --volume="${SCRIPT_DIR}:/docs" \
  squidfunk/mkdocs-material:9.6.14@sha256:eb04b60c566a8862be6b553157c16a92fbbfc45d71b7e4e8593526aecca63f52 \
  "$@"
