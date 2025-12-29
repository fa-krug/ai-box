# Claude in AI-Box

This guide explains how to use Claude Code CLI within the AI-Box environment.

## Quick Start

### Launch Claude
There are two ways to launch Claude:

1. **Via zellij shortcut** (from any session):
   ```
   Ctrl+A + c
   ```
   This creates a new tab with Claude running.

2. **Direct command** (in any pane):
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

## Integration with Zellij Layouts

Claude runs in its own tab within zellij. You can:
- Switch between Claude and other AI tools using tab navigation (`Ctrl+T`)
- Run multiple instances of Claude in different tabs
- Use pane mode (`Ctrl+P`) to split your workspace

### Example Workflow

1. Launch zellij (auto-happens on SSH login)
2. Press `Ctrl+A + g` to open Gemini in a new tab
3. Press `Ctrl+A + c` to open Claude in another tab
4. Press `Ctrl+T + l` to switch to the next tab (Claude)
5. Use `Ctrl+T + h` to go back to Gemini

## Tips

- **Session Persistence:** Your Claude sessions persist when you detach from zellij and reconnect.
- **Background Operation:** Claude runs in its own tab, allowing you to work in other panes/tabs simultaneously.
- **History:** Claude maintains conversation history within a session.
- **Scrollback:** Use scroll mode (`Ctrl+S`) to review previous interactions.

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

## More Information

- [Claude Code Documentation](https://claude.com/claude-code)
- [Anthropic API Docs](https://docs.anthropic.com)
