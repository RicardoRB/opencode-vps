#!/usr/bin/env bash
set -e

CONFIG_DIR="/root/.config/opencode"

mkdir -p "$CONFIG_DIR"

# Instalar OMO únicamente la primera vez
if [ ! -f "$CONFIG_DIR/.omo-installed" ]; then

  npx lazycodex-ai install \
    --no-tui \
    --platform=opencode \
    --claude=no \
    --openai=yes \
    --gemini=no \
    --copilot=no \
    --skip-auth

  touch "$CONFIG_DIR/.omo-installed"
fi

if [ -n "$GITHUB_TOKEN" ]; then
    echo "$GITHUB_TOKEN" | gh auth login --with-token
fi

# IMPORTANTE: Ejecuta el CMD definido en el Dockerfile
exec "$@"