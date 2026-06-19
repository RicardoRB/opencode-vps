#!/usr/bin/env bash
set -e

CONFIG_DIR="/root/.config/opencode"

mkdir -p "$CONFIG_DIR"

# Instalar OMO únicamente la primera vez
if [ ! -f "$CONFIG_DIR/.omo-installed" ]; then

  pnpm exec oh-my-openagent install \
    --no-tui \
    --platform=opencode \
    --claude=no \
    --openai=yes \
    --gemini=no \
    --copilot=no \
    --skip-auth

  touch "$CONFIG_DIR/.omo-installed"
fi

# if [ -n "$GITHUB_TOKEN" ]; then
#     echo "$GITHUB_TOKEN" | gh auth login --with-token
# fi

exec opencode web \
  --hostname 0.0.0.0 \
  --port 4096