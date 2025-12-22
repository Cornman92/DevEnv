# DevEnv .zshrc configuration
# ~/.zshrc: executed by zsh for interactive shells

# ============================================================================
# History Configuration
# ============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# ============================================================================
# Zsh Options
# ============================================================================
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt CORRECT
setopt EXTENDED_GLOB
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt PROMPT_SUBST

# ============================================================================
# Completion System
# ============================================================================
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Menu selection
zstyle ':completion:*' menu select

# Color completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better completion for kill command
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# Cache completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# ============================================================================
# Key Bindings
# ============================================================================
bindkey -e  # Emacs-style key bindings

# History search with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# ============================================================================
# Environment Variables
# ============================================================================
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export VISUAL=vim
export TERM=xterm-256color

# ============================================================================
# Aliases
# ============================================================================

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'

# ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lhrt'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias glog='git log --oneline --graph --decorate --all'
alias gstash='git stash'
alias gpop='git stash pop'

# Docker aliases
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dstop='docker stop'
alias dstart='docker start'
alias drm='docker rm'
alias drmi='docker rmi'
alias dprune='docker system prune -af'

# Docker Compose aliases
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dcrestart='docker-compose restart'
alias dclogs='docker-compose logs -f'
alias dcps='docker-compose ps'

# Python aliases
alias py='python'
alias py3='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'
alias deactivate='deactivate'

# Node/npm aliases
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nci='npm ci'

# Yarn aliases
alias y='yarn'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn remove'
alias yi='yarn install'
alias ys='yarn start'
alias yt='yarn test'

# Utility aliases
alias h='history'
alias c='clear'
alias e='exit'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias ports='netstat -tulanp'
alias wget='wget -c'
alias myip='curl -s https://api.ipify.org && echo'

# Directory listing
if command -v exa &> /dev/null; then
    alias ls='exa'
    alias ll='exa -alh --git'
    alias la='exa -a'
    alias lt='exa -alh --sort=modified'
    alias tree='exa --tree'
fi

# Cat replacement
if command -v bat &> /dev/null; then
    alias cat='bat --style=auto'
    alias ccat='cat'  # original cat
fi

# Grep replacement
if command -v rg &> /dev/null; then
    alias grep='rg'
    alias oldgrep='grep'  # original grep
fi

# ============================================================================
# Functions
# ============================================================================

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *.xz)        unxz "$1"        ;;
            *.exe)       cabextract "$1"  ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find file by name
ff() {
    find . -type f -iname "*$1*"
}

# Find directory by name
fd() {
    find . -type d -iname "*$1*"
}

# Git shortcuts
gacp() {
    git add -A && git commit -m "$1" && git push
}

# Quick server
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Update all package managers
update-all() {
    echo "Updating system packages..."
    sudo apt update && sudo apt upgrade -y

    echo -e "\nUpdating Python packages..."
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U

    echo -e "\nUpdating npm global packages..."
    npm update -g

    echo -e "\nUpdating Rust toolchain..."
    rustup update

    echo -e "\nAll updates complete!"
}

# Docker cleanup
docker-cleanup() {
    echo "Cleaning up Docker..."
    docker system prune -af --volumes
    echo "Docker cleanup complete!"
}

# Show system info
sysinfo() {
    echo "=== System Information ==="
    echo "OS: $(uname -s)"
    echo "Kernel: $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "Hostname: $(hostname)"
    echo "CPU: $(nproc) cores"
    echo "Memory: $(free -h | awk '/^Mem:/ {print $2}')"
    echo "Disk: $(df -h / | awk 'NR==2 {print $2 " total, " $4 " available"}')"
}

# ============================================================================
# Development Tools
# ============================================================================

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d "$PYENV_ROOT" ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"
fi
if [[ -s "$NVM_DIR/bash_completion" ]]; then
    source "$NVM_DIR/bash_completion"
fi

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Rust/Cargo
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"
export PATH="$CARGO_HOME/bin:$PATH"

# ============================================================================
# Additional PATH
# ============================================================================
export PATH="$HOME/.local/bin:$PATH"

# ============================================================================
# Plugins and Enhancements
# ============================================================================

# Enable colors
autoload -U colors && colors

# Starship Prompt (if installed)
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# FZF (Fuzzy Finder)
if command -v fzf &> /dev/null; then
    source <(fzf --zsh) 2>/dev/null || true
fi

# ============================================================================
# Custom Configurations
# ============================================================================
# Load custom user configurations if they exist
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

# ============================================================================
# Welcome Message
# ============================================================================
echo "DevEnv - Development Environment v0.1.0"
echo "Type 'help' for common commands or see documentation at docs/"
echo "Shell: Zsh $(zsh --version | cut -d ' ' -f 2)"
