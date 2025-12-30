# Claude in AI-Box

This guide explains how to use Claude Code CLI within the AI-Box environment.

## Quick Start

### Launch Claude

Simply run:
```bash
claude
```

## Setup

### Prerequisites
- An Anthropic API Key (for Claude)
- The `claude` command installed (included in AI-Box)

### Authentication

When you first run Claude, you'll be prompted to authenticate. You can do this in several ways:

1. **Interactive authentication:**
   ```bash
   claude
   ```
   Follow the prompts to authenticate with your Anthropic credentials.

2. **Via environment variable:**
   Set your API key when starting the container:
   ```bash
   docker run -e ANTHROPIC_API_KEY="your_api_key_here" ...
   ```

3. **Via configuration file:**
   Claude stores credentials in `~/.anthropic` (which persists across restarts).

## Usage

Once authenticated, you can use Claude interactively:

```bash
claude
```

This launches the Claude CLI where you can:
- Chat with Claude directly
- Ask questions and get responses
- Use Claude for code generation, analysis, and more

### Common Workflows

**Code Analysis:**
```bash
claude "Analyze this function for performance issues"
```

**Code Generation:**
```bash
claude "Generate a Python function that validates email addresses"
```

**Documentation:**
```bash
claude "Generate comprehensive documentation for this module"
```

## Tips

- **Session Persistence:** Your Claude sessions persist across reconnections.
- **History:** Claude maintains conversation history within a session.

## Troubleshooting

### "claude: command not found"
- The layout will fall back to bash if the command isn't available
- Run `which claude` to check if it's installed
- Rebuild the container if needed

### Authentication Issues
- Ensure your API key is correct
- Check that `ANTHROPIC_API_KEY` environment variable is set
- Delete `~/.anthropic` and re-authenticate if credentials are corrupted

### Claude not responding
- Check your internet connection
- Verify your API key has available quota
- Try restarting the Claude session

## Happy Coder: Mobile-First Claude Access

Happy Coder is a mobile and web client for Claude that extends your AI-assisted development to iOS, Android, and web platforms. It provides realtime voice support and end-to-end encryption for your code.

### Quick Start

Instead of running `claude`, run:
```bash
happy
```

This launches the Happy Coder interface with mobile support enabled.

### Setup

#### Prerequisites
- An Anthropic API Key (for Claude)
- A Happy.engineering account (optional, for cloud sync and mobile features)
- The `happy` command installed (included in AI-Box)

#### Authentication

Happy Coder uses the same Anthropic API Key as Claude:

1. **Via environment variable (recommended for AI-Box):**
   ```bash
   docker run -e ANTHROPIC_API_KEY="your_api_key_here" ...
   ```

2. **Interactive authentication:**
   When you first run `happy`, it will prompt you to authenticate with your Anthropic credentials.

3. **Via configuration file:**
   Happy Coder stores credentials in `~/.happy` (persists across restarts).

### Usage

#### Basic Usage

Start a Happy Coder session:
```bash
happy
```

#### Mobile Control

Once `happy` is running:

1. **Desktop Mode:** Your desktop/SSH session has control
2. **Mobile Mode:** Open the Happy Coder app on iOS/Android and connect to your session
3. **Switching Control:**
   - Press any keyboard key on desktop to regain control
   - Switch to mobile for remote monitoring and voice interactions

#### Command-Line Options

```bash
happy --help                    # View all available options
happy                          # Start interactive session
happy --no-mobile              # Start without mobile support
```

### Features

- **Mobile Access:** Monitor and control AI coding from your iPhone or Android device
- **Realtime Voice:** Use voice commands and get voice responses
- **Device Switching:** Seamlessly pass control between desktop and mobile
- **End-to-End Encryption:** Your code never leaves your devices unencrypted
- **Cross-Platform:** Available on iOS, Android, and web browsers
- **Notifications:** Get alerts when Claude needs permissions or encounters issues

### Use Cases

**Remote Development:**
```bash
happy
# Connect from your iPhone to monitor progress while away from desk
```

**Voice-Assisted Coding:**
```bash
happy
# Use voice commands for hands-free interaction
```

**Real-Time Collaboration:**
Use Happy's web interface to share your session with team members in real-time.

### Differences from Claude

| Feature | Claude | Happy Coder |
|---------|--------|-------------|
| Desktop CLI | ✓ | ✓ |
| Mobile App | ✗ | ✓ |
| Voice Support | ✗ | ✓ |
| Realtime Sync | ✗ | ✓ |
| Web Interface | ✗ | ✓ |
| End-to-End Encryption | Limited | ✓ |

### Troubleshooting

### "happy: command not found"
- Run `which happy` to check if it's installed
- Rebuild the container if needed: `docker build -t ai-box .`

### Mobile Device Can't Connect
- Ensure both devices are on the same network (or using Happy's cloud relay)
- Check that your AI-Box container is running: `docker ps`
- Verify SSH/network connectivity to the container

### Authentication Issues with Happy
- Ensure your Anthropic API Key is correct
- Check that `ANTHROPIC_API_KEY` environment variable is set
- Delete `~/.happy` directory and re-authenticate
- Run `happy` to re-login interactively

### Voice Not Working
- Check microphone permissions on your mobile device
- Ensure audio is unmuted in the Happy app settings
- Verify internet connectivity between desktop and mobile device

## More Information

- [Happy.engineering](https://happy.engineering)
- [Happy on GitHub](https://github.com/slopus/happy)
- [Claude Code Documentation](https://claude.com/claude-code)
- [Anthropic API Docs](https://docs.anthropic.com)
