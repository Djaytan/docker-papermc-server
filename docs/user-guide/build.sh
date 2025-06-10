#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

cd "${SCRIPT_DIR}"

sh mkdocs.sh build --strict
