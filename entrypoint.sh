#!/usr/bin/env bash
set -euxo pipefail

CONFIG_DIR="/root/.config/opencode"

mkdir -p "$CONFIG_DIR"

if [ -n "${GITHUB_TOKEN:-}" ]; then
    gh auth setup-git
fi

# if [ ! -f "$CONFIG_DIR/.omo-installed" ]; then
#     echo "Installing Oh My OpenAgent..."

#     bunx oh-my-openagent install \
#         --no-tui \
#         --platform=opencode \
#         --claude=no \
#         --gemini=no \
#         --copilot=no

#     touch "$CONFIG_DIR/.omo-installed"

#     echo "Oh My OpenAgent installed successfully."
# fi

exec "$@"