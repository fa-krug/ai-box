#!/bin/bash
# Set root password from environment variable
if [ -n "$SSH_PASSWORD" ]; then
  echo "root:$SSH_PASSWORD" | chpasswd
fi

# Start SSH service
service ssh start

# Keep container running (SSH service runs in background)
tail -f /dev/null
