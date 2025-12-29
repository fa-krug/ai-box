FROM node:20-bookworm

# Install SSH, tmux, essential dev tools, and Python
RUN apt-get update && apt-get install -y \
    openssh-server \
    tmux \
    curl \
    git \
    vim \
    nano \
    htop \
    ripgrep \
    fzf \
    python3 \
    python3-pip \
    python3-venv \
    && mkdir /var/run/sshd \
    && rm -rf /var/lib/apt/lists/*

# Install AI CLIs (Gemini + Claude + Cursor)
RUN npm install -g @google/gemini-cli @anthropic-ai/claude-code

# Configs
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
COPY tmux.conf /root/.tmux.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Auto-attach to tmux session on SSH login
RUN cat >> ~/.bashrc << 'EOF'
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t ai-bot || tmux new-session -s ai-bot
fi
EOF

WORKDIR /work
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]