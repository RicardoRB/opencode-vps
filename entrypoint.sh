#!/usr/bin/env bash
set -euxo pipefail

CONFIG_DIR="/root/.config/opencode"

mkdir -p "$CONFIG_DIR"

if [ -n "${GITHUB_TOKEN:-}" ]; then
    gh auth setup-git
fi

exec "$@"
