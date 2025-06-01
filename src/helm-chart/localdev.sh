#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)

cd "${SCRIPT_DIR}"

helm upgrade --install localdev-papermc-server . \
  --values values.yaml \
  --set eula=true \
  --atomic --timeout 40s \
  --cleanup-on-fail \
  --output yaml
