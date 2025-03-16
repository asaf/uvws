#!/bin/bash

set -e

PROJECT_ROOT="$(dirname "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")")"
VIRTUAL_ENV="$PROJECT_ROOT/.venv"

cd "$PROJECT_ROOT" || exit

printf '%s\n' "Releasing root..."
"$VIRTUAL_ENV/bin/semantic-release" -vv --noop version --no-push

# "$VIRTUAL_ENV/bin/semantic-release" -v publish

# printf '%s\n' "Writing changelog for $SERVICE_NAME..."
# "$VIRTUAL_ENV/bin/semantic-release" -v changelog
