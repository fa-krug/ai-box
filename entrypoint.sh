#!/bin/bash
# Set root password from environment variable
if [ -n "$SSH_PASSWORD" ]; then
  echo "root:$SSH_PASSWORD" | chpasswd
fi

# Start SSH service
service ssh start

# Create a session named 'ai-box' if it doesn't exist. 
# Window 0 is just a standard bash shell.
tmux new-session -d -s ai-box -n "Shell" "bash"

# Attach to the session
tmux attach-session -t ai-box
