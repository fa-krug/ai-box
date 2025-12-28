# AI-Box

A Dockerized development environment optimized for mobile (iPhone) access via SSH and tmux, pre-loaded with Gemini and Claude CLIs, and essential dev tools.

## Features

- **Multi-Arch Support:** Builds for both `amd64` and `arm64` (perfect for Raspberry Pi or Cloud VMs).
- **SSH Access:** Connect from anywhere (e.g., using Termius on iPhone).
- **tmux Pre-configured:** Optimized for touch-based scrolling and easy AI launching.
- **AI CLIs:** Includes `gemini` and `claude` (Anthropic Claude Code).
- **Dev Tools:** Pre-installed with `git`, `vim`, `nano`, `htop`, `ripgrep`, `fzf`.
- **Python Ready:** Includes Python 3, pip, and venv support.
- **Persistent Storage:** 
    - Mounts your local project folder into `/work`.
    - Persists AI login sessions (config) and bash history across restarts.

## Local Setup

1. **Set Environment Variables:**
   ```bash
   export GEMINI_API_KEY="your_api_key_here"
   export SSH_PASSWORD="your_secure_password"
   ```

2. **Start with Docker Compose:**
   ```bash
   docker-compose up -d
   ```

3. **Connect via SSH:**
   ```bash
   ssh root@localhost -p 2222
   ```

## tmux Shortcuts (Prefix is `Ctrl+A`)

- `Ctrl+A` + `g`: Open Gemini in a new window.
- `Ctrl+A` + `c`: Open Claude in a new window.
- `Ctrl+A` + `n`: Next window.
- `Ctrl+A` + `p`: Previous window.
- **Scrolling:** Mouse mode is enabled for touch swiping.

## CI/CD (GitHub Actions)

This repository includes a GitHub Action that automatically builds and pushes a multi-arch Docker image to Docker Hub on every push to `main` or on new tags.

### Required GitHub Secrets

To use the automated build, add these secrets to your GitHub repository:
- `DOCKERHUB_USERNAME`: Your Docker Hub username.
- `DOCKERHUB_TOKEN`: Your Docker Hub Personal Access Token.

## Requirements

- Docker and Docker Compose.
- A Gemini API Key (for `gemini-cli`).
- An Anthropic API Key (for `claude-code`).
