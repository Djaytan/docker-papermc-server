#!/usr/bin/env sh
# Compile requirements.txt using pip-compile

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

echo 'Compile the requirements.txt file using pip-compile'
echo

cd "$SCRIPT_DIR"
sh pip-compile/pip-compile.sh --generate-hashes
