#!/usr/bin/env sh
# This script aims to wrap MkDocs Material CLI through Docker in order to ensure portability across systems (Windows, Linux, Mac)

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" > /dev/null 2>&1 && pwd -P)"

# On Windows environments (Cygwin, MinGW, MSYS), Docker volume mounts require Windows-style paths.
# However, automatic path conversion by MSYS can cause unexpected issues,
# so we disable it and convert paths explicitly and deliberately.
# See: https://cygwin.com/cygwin-ug-net/using-effectively.html
# Kernel detection approach based on recommendations from:
# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
case "$(uname)" in
  CYGWIN*|MINGW*|MSYS*)
    # We disable automatic path conversion to avoid unexpected side effects
    export MSYS_NO_PATHCONV=1
    # We manually enforce a Windows path to prevent issues with Docker
    SCRIPT_DIR="$(cygpath --windows "${SCRIPT_DIR}")"
    ;;
esac

# Constraint: MkDocs' Git plugin requires access to the Git history.
ROOT_PROJECT_DIR="${SCRIPT_DIR}/../.."

echo 'Building Docker image for MkDocs (can take up to a minute)'
docker build --progress quiet -t docker-papermc-server/mkdocs "${SCRIPT_DIR}"

# Avoid exceeding the GitHub API rate limits
GITHUB_TOKEN="${GITHUB_TOKEN:-$(gh auth token)}"

echo
echo 'Running MkDocs:'
# Avoid permission issues by running the container with the current user ID and group ID.
docker run --rm -p 8000:8000 --name docker-papermc-server-mkdocs \
  --user "$(id -u):$(id -g)" \
  --mount type=bind,source="${ROOT_PROJECT_DIR}",target=/run \
  --workdir /run/docs/user-guide \
  -e MKDOCS_GIT_COMMITTERS_APIKEY="${GITHUB_TOKEN}" \
  docker-papermc-server/mkdocs \
  "$@"
