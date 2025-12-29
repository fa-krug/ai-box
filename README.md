# AI-Box

A Dockerized development environment optimized for mobile (iPhone) access via SSH and zellij, pre-loaded with Gemini and Claude CLIs, and essential dev tools.

## Features

- **Multi-Arch Support:** Builds for both `amd64` and `arm64` (perfect for Raspberry Pi or Cloud VMs).
- **SSH Access:** Connect from anywhere (e.g., using Termius on iPhone).
- **zellij Pre-configured:** Modern terminal multiplexer optimized for touch-based scrolling and easy AI launching.
- **Welcome Screen:** Interactive session manager on SSH connection for creating/attaching to sessions.
- **AI CLIs:** Includes `gemini`, `claude` (Anthropic Claude Code), and `cursor` agent.
- **Dev Tools:** Pre-installed with `git`, `vim`, `nano`, `htop`, `ripgrep`, `fzf`.
- **Python Ready:** Includes Python 3, pip, and venv support.
- **Persistent Storage:**
    - Mounts your local project folder into `/work`.
    - Persists AI agent configurations (Gemini, Claude, Cursor) across restarts.
    - Persists zellij sessions across container restarts.
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

2. **Start with Docker Compose:**
   ```bash
   docker-compose up -d
   ```

3. **Connect via SSH:**
   ```bash
   ssh root@localhost -p 2222
   ```

   Upon connection, you'll see the zellij welcome screen where you can:
   - Create a new session (with optional name and working directory)
   - Attach to an existing session
   - Resurrect a previous session

## zellij Shortcuts

### AI Tool Launching (Prefix is `Ctrl+A`)
- `Ctrl+A` + `g`: Open Gemini in a new tab.
- `Ctrl+A` + `c`: Open Claude in a new tab.
- `Ctrl+A` + `r`: Open Cursor agent in a new tab.
- `Ctrl+A` + `n`: Next tab.
- `Ctrl+A` + `p`: Previous tab.

### Session Management
- `Ctrl+O` + `w`: Open session manager (create/attach/switch sessions).
- `Ctrl+O` + `d`: Detach from current session.

### Navigation & Modes
- `Ctrl+P`: Pane mode (create/close/navigate panes).
- `Ctrl+T`: Tab mode (create/close/navigate tabs).
- `Ctrl+S`: Scroll mode (scroll back through history, search).
- `Ctrl+N`: Resize mode (resize panes).

### Other Features
- **Mouse Mode:** Enabled for touch swiping and pane selection.
- **Session Resurrection:** Sessions automatically persist and can be restored on reconnect.

## Cursor Agent Setup

Cursor is an AI-powered code editor and agent included in this environment. To use Cursor agent features:

1. **First Time Setup:**
   ```bash
   # Inside the container, authenticate with your Cursor API key
   cursor login
   ```

2. **Using Cursor Agent:**
   - Access via zellij shortcut: `Ctrl+A` + `r`
   - Or run directly: `cursor`
   - Your Cursor configuration persists via the `ai_box_cursor` volume

3. **API Key Management:**
   - Your authentication tokens are stored in `/root/.cursor`
   - This directory is mounted as a persistent volume to survive container restarts
   - Set `CURSOR_API_KEY` in your environment for automated authentication

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
- A Cursor API Key (for `cursor` agent) - *optional*.
