# DevEnv - Development Environment Dockerfile
# Base image: Ubuntu 24.04 LTS
FROM ubuntu:24.04

# Metadata
LABEL maintainer="DevEnv Contributors"
LABEL description="Comprehensive development environment with modern tools"
LABEL version="0.1.0"

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set locale
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set timezone
ENV TZ=UTC

# Create a non-root user for development
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install base system packages and utilities
RUN apt-get update && apt-get install -y \
    # Build essentials
    build-essential \
    gcc \
    g++ \
    make \
    cmake \
    autoconf \
    automake \
    pkg-config \
    # Version control
    git \
    git-lfs \
    # Shell
    zsh \
    bash-completion \
    # Core utilities
    curl \
    wget \
    vim \
    nano \
    openssh-client \
    gnupg \
    ca-certificates \
    software-properties-common \
    apt-transport-https \
    # System tools
    htop \
    ncdu \
    tree \
    jq \
    ripgrep \
    fd-find \
    # Network tools
    netcat-openbsd \
    iputils-ping \
    dnsutils \
    # Locales
    locales \
    # Compression
    zip \
    unzip \
    tar \
    gzip \
    bzip2 \
    xz-utils \
    # SSL/TLS
    openssl \
    # Other
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Generate locale
RUN locale-gen en_US.UTF-8

# Create non-root user with sudo privileges
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install Python with pyenv
USER $USERNAME
WORKDIR /home/$USERNAME

ENV PYENV_ROOT="/home/$USERNAME/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

RUN curl https://pyenv.run | bash \
    && eval "$(pyenv init -)" \
    && pyenv install 3.12.0 \
    && pyenv install 3.11.6 \
    && pyenv global 3.12.0

# Install Node.js with nvm
ENV NVM_DIR="/home/$USERNAME/.nvm"
ENV NODE_VERSION=20.10.0

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV PATH="$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH"

# Install common Python tools
RUN . "$PYENV_ROOT/bin/activate" \
    && pip install --upgrade pip \
    && pip install \
        pipenv \
        poetry \
        black \
        pylint \
        flake8 \
        mypy \
        pytest \
        ipython \
        jupyter

# Install common Node.js tools
RUN . "$NVM_DIR/nvm.sh" \
    && npm install -g \
        typescript \
        ts-node \
        eslint \
        prettier \
        yarn \
        pnpm

# Install Go
USER root
ENV GO_VERSION=1.21.5
ENV GOROOT=/usr/local/go
ENV GOPATH=/home/$USERNAME/go
ENV PATH=$GOROOT/bin:$GOPATH/bin:$PATH

RUN curl -OL https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz \
    && rm go${GO_VERSION}.linux-amd64.tar.gz

# Install Rust
USER $USERNAME
ENV RUSTUP_HOME="/home/$USERNAME/.rustup"
ENV CARGO_HOME="/home/$USERNAME/.cargo"
ENV PATH="$CARGO_HOME/bin:$PATH"

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && . "$CARGO_HOME/env" \
    && rustup component add rustfmt clippy rust-analyzer

# Install Docker CLI (for use with Docker-in-Docker or Docker socket mounting)
USER root
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce-cli docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

# Install GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

# Install additional useful tools
RUN apt-get update && apt-get install -y \
    # Database clients
    postgresql-client \
    mysql-client \
    redis-tools \
    # HTTP tools
    httpie \
    # Text processing
    bat \
    exa \
    && rm -rf /var/lib/apt/lists/*

# Install Starship prompt
USER $USERNAME
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# Copy configuration files
USER root
COPY --chown=$USERNAME:$USERNAME ../dotfiles/.bashrc /home/$USERNAME/.bashrc
COPY --chown=$USERNAME:$USERNAME ../dotfiles/.zshrc /home/$USERNAME/.zshrc
COPY --chown=$USERNAME:$USERNAME ../dotfiles/.gitconfig /home/$USERNAME/.gitconfig

# Set Zsh as default shell
RUN chsh -s $(which zsh) $USERNAME

# Create workspace directory
RUN mkdir -p /workspace && chown $USERNAME:$USERNAME /workspace

# Switch to non-root user
USER $USERNAME
WORKDIR /workspace

# Set default shell to zsh
SHELL ["/bin/zsh", "-c"]

# Default command
CMD ["/bin/zsh"]
