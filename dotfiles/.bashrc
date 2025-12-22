# DevEnv .bashrc configuration
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ============================================================================
# History Configuration
# ============================================================================
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT="%F %T "
shopt -s histappend

# ============================================================================
# Shell Options
# ============================================================================
shopt -s checkwinsize
shopt -s globstar 2> /dev/null
shopt -s cdspell
shopt -s dirspell
shopt -s nocaseglob

# ============================================================================
# Colors and Prompt
# ============================================================================
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Enable color support for ls and other tools
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ============================================================================
# Aliases
# ============================================================================

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lhrt'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate'

# Docker aliases
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs -f'

# Python aliases
alias py='python'
alias py3='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# Node/npm aliases
alias nr='npm run'
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'

# Utility aliases
alias h='history'
alias c='clear'
alias e='exit'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias ports='netstat -tulanp'
alias wget='wget -c'

# Modern replacements (if installed)
if command -v bat &> /dev/null; then
    alias cat='bat'
fi

if command -v exa &> /dev/null; then
    alias ls='exa'
    alias ll='exa -alh'
    alias lt='exa -alh --sort=modified'
    alias tree='exa --tree'
fi

if command -v rg &> /dev/null; then
    alias grep='rg'
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
    if [ -f "$1" ]; then
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

# Get current public IP
myip() {
    curl -s https://api.ipify.org
    echo
}

# ============================================================================
# Environment Variables
# ============================================================================

# Default editor
export EDITOR=vim
export VISUAL=vim

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ============================================================================
# Development Tools
# ============================================================================

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
    . "$NVM_DIR/bash_completion"
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
# Bash Completion
# ============================================================================
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ============================================================================
# Starship Prompt (if installed)
# ============================================================================
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# ============================================================================
# Custom Configurations
# ============================================================================
# Load custom user configurations if they exist
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

# Welcome message
echo "DevEnv - Development Environment v0.1.0"
echo "Type 'help' for common commands or see documentation at docs/"
