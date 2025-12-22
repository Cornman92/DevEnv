#!/usr/bin/env bash

# DevEnv Setup Script
# This script sets up the development environment

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Log functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        log_error "This script should not be run as root"
        exit 1
    fi
}

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            OS=$ID
            VERSION=$VERSION_ID
        else
            OS="unknown"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        VERSION=$(sw_vers -productVersion)
    else
        OS="unknown"
    fi

    log_info "Detected OS: $OS $VERSION"
}

# Check dependencies
check_dependencies() {
    log_info "Checking dependencies..."

    local deps=("git" "curl" "docker")
    local missing=()

    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing+=("$dep")
        fi
    done

    if [ ${#missing[@]} -ne 0 ]; then
        log_error "Missing dependencies: ${missing[*]}"
        log_info "Please install the missing dependencies and try again"
        exit 1
    fi

    log_success "All dependencies found"
}

# Check Docker
check_docker() {
    log_info "Checking Docker..."

    if ! docker info &> /dev/null; then
        log_error "Docker daemon is not running"
        log_info "Please start Docker and try again"
        exit 1
    fi

    log_success "Docker is running"
}

# Build Docker image
build_docker_image() {
    log_info "Building Docker image..."

    cd "$PROJECT_ROOT"

    if docker-compose -f docker/docker-compose.yml build; then
        log_success "Docker image built successfully"
    else
        log_error "Failed to build Docker image"
        exit 1
    fi
}

# Setup dotfiles
setup_dotfiles() {
    log_info "Setting up dotfiles..."

    local dotfiles=(".bashrc" ".zshrc" ".gitconfig")
    local backup_dir="$HOME/.devenv_backup_$(date +%Y%m%d_%H%M%S)"

    for dotfile in "${dotfiles[@]}"; do
        local src="$PROJECT_ROOT/dotfiles/$dotfile"
        local dest="$HOME/$dotfile"

        if [ -f "$dest" ]; then
            log_warning "$dest already exists"
            read -p "Backup and replace? (y/n) " -n 1 -r
            echo

            if [[ $REPLY =~ ^[Yy]$ ]]; then
                mkdir -p "$backup_dir"
                cp "$dest" "$backup_dir/"
                log_info "Backed up to $backup_dir/$dotfile"

                cp "$src" "$dest"
                log_success "Installed $dotfile"
            else
                log_info "Skipped $dotfile"
            fi
        else
            cp "$src" "$dest"
            log_success "Installed $dotfile"
        fi
    done

    # Prompt for git user configuration
    if ! git config --global user.name &> /dev/null; then
        read -p "Enter your Git username: " git_name
        git config --global user.name "$git_name"
    fi

    if ! git config --global user.email &> /dev/null; then
        read -p "Enter your Git email: " git_email
        git config --global user.email "$git_email"
    fi

    log_success "Dotfiles setup complete"
}

# Start Docker environment
start_environment() {
    log_info "Starting development environment..."

    cd "$PROJECT_ROOT"

    if docker-compose -f docker/docker-compose.yml up -d; then
        log_success "Development environment started"
    else
        log_error "Failed to start environment"
        exit 1
    fi
}

# Show completion message
show_completion() {
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                                                        ║${NC}"
    echo -e "${GREEN}║  DevEnv Setup Complete!                                ║${NC}"
    echo -e "${GREEN}║                                                        ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
    echo ""
    log_info "Next steps:"
    echo "  1. Enter the development environment:"
    echo "     docker-compose -f docker/docker-compose.yml exec devenv zsh"
    echo ""
    echo "  2. Or use the helper script:"
    echo "     ./scripts/enter.sh"
    echo ""
    echo "  3. Stop the environment:"
    echo "     docker-compose -f docker/docker-compose.yml down"
    echo ""
    log_info "Documentation: $PROJECT_ROOT/docs/"
    echo ""
}

# Main function
main() {
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════════════════════╗"
    echo "║                                                        ║"
    echo "║  DevEnv Setup Script                                   ║"
    echo "║  Version: 0.1.0                                        ║"
    echo "║                                                        ║"
    echo "╚════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""

    check_root
    detect_os
    check_dependencies
    check_docker

    log_info "Starting setup..."
    echo ""

    build_docker_image
    echo ""

    read -p "Setup dotfiles on host? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup_dotfiles
        echo ""
    fi

    read -p "Start development environment? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        start_environment
        echo ""
    fi

    show_completion
}

# Run main function
main "$@"
