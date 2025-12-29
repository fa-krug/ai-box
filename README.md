# AI-Box

A Dockerized development environment optimized for mobile (iPhone) access via SSH, pre-loaded with Gemini and Claude CLIs, and essential dev tools.

## Features

- **Multi-Arch Support:** Builds for both `amd64` and `arm64` (perfect for Raspberry Pi or Cloud VMs).
- **SSH Access:** Connect from anywhere (e.g., using Termius on iPhone).
- **AI CLIs:** Includes `gemini`, `claude`, and `cursor-agent`.
- **Dev Tools:** Pre-installed with `git`, `vim`, `nano`, `htop`, `ripgrep`, `fzf`.
- **Python Ready:** Includes Python 3, pip, and venv support.
- **Persistent Storage:**
    - Mounts your local project folder into `/work`.
    - Persists AI agent configurations across restarts.
    - Persists bash history across container restarts.

## Local Setup

1. **Set Environment Variables:**
   ```bash
   export GEMINI_API_KEY="your_gemini_api_key_here"
   export SSH_PASSWORD="your_secure_password"
   ```

   Optional for Cursor agent:
   ```bash
   export CURSOR_API_KEY="your_cursor_api_key_here"
   ```

2. **Start the Container:**
   ```bash
   docker build -t ai-box .
   docker run -d \
     -p 2222:22 \
     -e SSH_PASSWORD="your_secure_password" \
     -e GEMINI_API_KEY="your_gemini_api_key_here" \
     -v $(pwd):/work \
     --name ai-box \
     ai-box
   ```

3. **Connect via SSH:**
   ```bash
   ssh root@localhost -p 2222
   ```

   You'll have a plain terminal session where you can run any commands directly.

## Using AI CLIs

Once connected via SSH, you can launch the AI tools directly:

### Claude
```bash
claude
```

### Gemini
```bash
gemini
```

### Cursor Agent
```bash
cursor-agent
```

All tools are available directly in your SSH session.

## CI/CD (GitHub Actions)

This repository includes a GitHub Action that automatically builds and pushes a multi-arch Docker image to Docker Hub on every push to `main` or on new tags.

### Required GitHub Secrets

To use the automated build, add these secrets to your GitHub repository:
- `DOCKERHUB_USERNAME`: Your Docker Hub username.
- `DOCKERHUB_TOKEN`: Your Docker Hub Personal Access Token.

## Requirements

- Docker
- A Gemini API Key (for `gemini`)
- An Anthropic API Key (for `claude`)
- A Cursor API Key (for `cursor-agent`) - *optional*
