FROM node:20-bookworm

# Install SSH, Mosh, essential dev tools, and Python
RUN apt-get update && apt-get install -y \
    openssh-server \
    mosh \
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
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /work
EXPOSE 22
EXPOSE 60000-61000/udp
ENTRYPOINT ["/entrypoint.sh"]