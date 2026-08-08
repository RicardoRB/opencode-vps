#!/usr/bin/env bash
set -e

CONFIG_DIR="/root/.config/opencode"

mkdir -p "$CONFIG_DIR"

# Instalar OMO únicamente la primera vez
if [ ! -f "$CONFIG_DIR/.omo-installed" ]; then
    echo "Installing Oh My OpenAgent..."

    bunx oh-my-openagent install \
        --no-tui \
        --platform=opencode

    touch "$CONFIG_DIR/.omo-installed"

    echo "Oh My OpenAgent installed successfully."
fi

# Autenticar GitHub CLI si existe el token
if [ -n "${GITHUB_TOKEN:-}" ]; then
    echo "$GITHUB_TOKEN" | gh auth login --with-token
fi

exec "$@"