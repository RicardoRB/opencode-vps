FROM oven/bun:1

# Dependencias base
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    jq \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# GitHub CLI (instalación oficial)
RUN mkdir -p -m 755 /etc/apt/keyrings && \
    wget -nv -O /etc/apt/keyrings/githubcli-archive-keyring.gpg \
      https://cli.github.com/packages/githubcli-archive-keyring.gpg && \
    chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      > /etc/apt/sources.list.d/github-cli.list && \
    apt-get update && \
    apt-get install -y gh && \
    rm -rf /var/lib/apt/lists/*

# OpenCode
ARG OPENCODE_VERSION=latest
RUN bun install -g "opencode-ai@${OPENCODE_VERSION}"

WORKDIR /workspace

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 4096

ENTRYPOINT ["/entrypoint.sh"]