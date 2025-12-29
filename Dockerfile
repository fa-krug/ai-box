FROM node:20-bookworm

# Install SSH, essential dev tools, and Python
RUN apt-get update && apt-get install -y \
    openssh-server \
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

# Install zellij (terminal multiplexer) - detect architecture
RUN ARCH=$(dpkg --print-architecture) && \
    ZELLIJ_ARCH=$([ "$ARCH" = "arm64" ] && echo "aarch64" || echo "x86_64") && \
    curl -L https://github.com/zellij-org/zellij/releases/latest/download/zellij-${ZELLIJ_ARCH}-unknown-linux-musl.tar.gz | tar -xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/zellij

# Configs
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir -p /root/.config/zellij/layouts
COPY config.kdl /root/.config/zellij/config.kdl
COPY layouts/gemini.kdl /root/.config/zellij/layouts/gemini.kdl
COPY layouts/claude.kdl /root/.config/zellij/layouts/claude.kdl
COPY layouts/cursor.kdl /root/.config/zellij/layouts/cursor.kdl
COPY layouts/welcome.kdl /root/.config/zellij/layouts/welcome.kdl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Auto-launch zellij welcome screen on SSH login
RUN cat >> ~/.bashrc << 'EOF'
exec zellij --layout welcome
EOF

WORKDIR /work
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]