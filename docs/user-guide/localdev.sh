#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

sh "${SCRIPT_DIR}"/mkdocs.sh serve --dev-addr 0.0.0.0:8000
