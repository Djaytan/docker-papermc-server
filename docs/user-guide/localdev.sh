#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

echo 'The preview is going to be available at http://localhost:8000/docker-papermc-server/'
echo

sh "${SCRIPT_DIR}/mkdocs" serve --dev-addr '0.0.0.0:8000'
