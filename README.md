# OpenCode VPS

A lightweight Docker-based environment for running OpenCode AI web interface with Bun and GitHub CLI support.

## Overview

This repository builds a container image based on `oven/bun:1`, installs system dependencies and GitHub CLI, then installs `opencode-ai` globally.

The container starts OpenCode web server on port `4096` using the `entrypoint.sh` script.

## Features

- Dockerized OpenCode web interface
- Installs GitHub CLI (`gh`) for repository workflows
- Uses Bun for package management and runtime
- Supports a simple `.env` file for optional GitHub token configuration

## Files

- `Dockerfile` - Builds the container image with required packages and installs `opencode-ai`
- `entrypoint.sh` - Initializes OpenCode config and launches the web server
- `.env.example` - Example environment variables file

## Requirements

- Docker installed on your machine
- Optional: GitHub token if you want to use authenticated GitHub features

## Usage

1. Copy the example environment file if you need a GitHub token:

```bash
cp .env.example .env
```

2. Build the Docker image:

```bash
docker build -t opencode-vps .
```

3. Run the container:

```bash
docker run --rm -p 4096:4096 --env-file .env opencode-vps
```

4. Open your browser and navigate to:

```text
http://localhost:4096
```

## Environment Variables

- `GITHUB_TOKEN` - Optional GitHub personal access token for GitHub CLI or OpenCode operations that require authentication.

## Notes

- The container installs `oh-my-openagent` only once per persisted configuration using a marker file at `/root/.config/opencode/.omo-installed`.
- If you enable `GITHUB_TOKEN`, uncomment and configure the `gh auth login` section in `entrypoint.sh`.

## Ports

- `4096` - OpenCode web UI

## License

This project does not include a license file by default. Add a `LICENSE` if you want to define reuse terms.
