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

## More Information

- [Claude Code Documentation](https://claude.com/claude-code)
- [Anthropic API Docs](https://docs.anthropic.com)
