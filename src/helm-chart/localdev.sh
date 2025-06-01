#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(dirname "$0")

cd "${SCRIPT_DIR}"

helm upgrade --install localdev-papermc-server . \
  --values values.yaml \
  --set eula=true \
  --atomic --timeout 40s \
  --cleanup-on-fail \
  --output yaml
