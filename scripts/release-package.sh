#!/bin/bash

set -e

PROJECT_ROOT="$(dirname "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")")"
VIRTUAL_ENV="$PROJECT_ROOT/.venv"

cd "$PROJECT_ROOT" || exit

SERVICE_NAME=$1


# Ensure the service folder exists
if [ ! -d "packages/$SERVICE_NAME" ]; then
  echo "Error: Directory packages/$SERVICE_NAME does not exist."
  exit 1
fi

# Release the service
pushd "packages/$SERVICE_NAME" >/dev/null || exit

printf '%s\n' "Releasing $SERVICE_NAME..."
"$VIRTUAL_ENV/bin/semantic-release" -vv version --no-push

# "$VIRTUAL_ENV/bin/semantic-release" -v publish

# printf '%s\n' "Writing changelog for $SERVICE_NAME..."
# "$VIRTUAL_ENV/bin/semantic-release" -v changelog

popd >/dev/null || exit