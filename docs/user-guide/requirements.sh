#!/usr/bin/env sh
# Prerequisites: pip install pip-tools

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

cd "$SCRIPT_DIR"

pip-compile --strip-extras --generate-hashes
