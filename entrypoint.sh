#!/usr/bin/env bash
set -euxo pipefail

CONFIG_DIR="/root/.config/opencode"
POSTINSTALL_SCRIPT="$(npm root -g)/opencode-ai/postinstall.mjs"

mkdir -p "$CONFIG_DIR"

if [ -f "$POSTINSTALL_SCRIPT" ]; then
    echo "Running OpenCode postinstall..."
    node "$POSTINSTALL_SCRIPT"
fi

if [ -n "${GITHUB_TOKEN:-}" ]; then
    gh auth setup-git
fi

if [ ! -f "$CONFIG_DIR/.omo-installed" ]; then
    echo "Installing Oh My OpenAgent..."

    bunx oh-my-openagent install \
        --no-tui \
        --platform=opencode \
        --claude=no \
        --gemini=no \
        --copilot=no

    touch "$CONFIG_DIR/.omo-installed"

    echo "Oh My OpenAgent installed successfully."
fi

exec "$@"