#!/usr/bin/env sh
# Compile requirements.txt using pip-compile

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

echo 'Compile the requirements.txt file using pip-tools...'

cd "$SCRIPT_DIR"
sh wrappers/pip-tools/pip-compile
