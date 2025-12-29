# AI-Box

A Dockerized development environment optimized for mobile (iPhone) access via SSH and zellij, pre-loaded with Gemini and Claude CLIs, and essential dev tools.

## Features

- **Multi-Arch Support:** Builds for both `amd64` and `arm64` (perfect for Raspberry Pi or Cloud VMs).
- **SSH Access:** Connect from anywhere (e.g., using Termius on iPhone).
- **zellij Auto-Launch:** Modern terminal multiplexer with built-in welcome screen that auto-launches on SSH connection.
- **AI CLIs:** Includes `gemini`, `claude`, and `cursor-agent`.
- **Dev Tools:** Pre-installed with `git`, `vim`, `nano`, `htop`, `ripgrep`, `fzf`.
- **Python Ready:** Includes Python 3, pip, and venv support.
- **Persistent Storage:**
    - Mounts your local project folder into `/work`.
    - Persists AI agent configurations across restarts.
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

   Upon connection, zellij will auto-launch with the built-in welcome screen where you can:
   - Create a new session
   - Attach to an existing session
   - View available layouts

## zellij Keybindings

### Entry Points
- `Ctrl+A`: Enter tmux-style mode (prefix for AI tool launching)
- `Ctrl+P`: Enter pane mode
- `Ctrl+T`: Enter tab mode
- `Ctrl+S`: Enter scroll mode
- `Ctrl+N`: Enter resize mode
- `Ctrl+O`: Enter session mode

### Tmux Mode (Activated with `Ctrl+A`)
- `g`: Open Gemini in a new tab
- `c`: Open Claude in a new tab
- `r`: Open Cursor agent in a new tab
- `n`: Go to next tab
- `p`: Go to previous tab
- `Ctrl+A`: Send literal Ctrl+A to inner shell
- `Esc`: Exit tmux mode

### Tab Mode (`Ctrl+T`)
- `n`: Create new tab
- `x`: Close current tab
- `h`/`Left`: Previous tab
- `l`/`Right`: Next tab

### Pane Mode (`Ctrl+P`)
- `n`: Create new pane
- `x`: Close current pane
- `h`/`Left`: Move focus left
- `l`/`Right`: Move focus right
- `j`/`Down`: Move focus down
- `k`/`Up`: Move focus up

### Scroll Mode (`Ctrl+S`)
- `j`/`Down`: Scroll down
- `k`/`Up`: Scroll up
- `Ctrl+f`/`PageDown`: Page scroll down
- `Ctrl+b`/`PageUp`: Page scroll up
- `d`: Half-page down
- `u`: Half-page up
- `/`: Search forward
- `?`: Search backward
- `e`: Edit scrollback with default editor

### Session Mode (`Ctrl+O`)
- `w`: Open session manager
- `d`: Detach from session
- `n`: Create new tab

### Resize Mode (`Ctrl+N`)
- `h`/`Left`: Increase left pane size
- `l`/`Right`: Increase right pane size
- `k`/`Up`: Increase top pane size
- `j`/`Down`: Increase bottom pane size
- `=`: Increase all panes
- `-`: Decrease all panes

### Features
- **Mouse Mode:** Enabled for touch swiping and pane selection
- **Session Persistence:** Sessions automatically persist and can be restored on reconnect

## Cursor Agent Setup

Cursor agent is an AI-powered assistant included in this environment. To use Cursor agent:

1. **Launch Cursor Agent:**
   - Access via zellij shortcut: `Ctrl+A` + `r` (creates a new tab with Cursor agent)
   - Or run directly: `cursor-agent`
   - Falls back to bash if the command is unavailable

2. **Configuration:**
   - Your Cursor agent configuration persists across container restarts
   - Set `CURSOR_API_KEY` in your environment for authentication

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
