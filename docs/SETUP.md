# DevEnv Setup Guide

This guide will help you set up the DevEnv development environment on your machine.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Docker** (version 20.10 or later)
- **Docker Compose** (v2 or later)
- **Git**
- At least 4GB of RAM
- At least 10GB of free disk space

### Installing Prerequisites

#### Ubuntu/Debian
```bash
# Install Docker
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER

# Log out and back in for group changes to take effect

# Install Docker Compose (v2)
sudo apt-get update
sudo apt-get install docker-compose-plugin

# Install Git
sudo apt-get install git
```

#### macOS
```bash
# Install Docker Desktop
# Download from: https://www.docker.com/products/docker-desktop

# Install Git (if not already installed)
brew install git
```

#### Windows (WSL2)
1. Install WSL2: https://docs.microsoft.com/en-us/windows/wsl/install
2. Install Docker Desktop for Windows with WSL2 backend
3. Install Git in your WSL2 distribution

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/DevEnv.git
cd DevEnv
```

### 2. Run the Setup Script

```bash
./scripts/setup.sh
```

The setup script will:
- Check for required dependencies
- Build the Docker image
- Optionally install dotfiles on your host
- Optionally start the development environment

### 3. Enter the Development Environment

Once setup is complete, you can enter the environment using:

```bash
./scripts/enter.sh
```

Or manually:

```bash
docker-compose -f docker/docker-compose.yml exec devenv zsh
```

## Manual Setup

If you prefer to set up manually:

### Build the Docker Image

```bash
cd DevEnv
docker-compose -f docker/docker-compose.yml build
```

### Start the Environment

```bash
docker-compose -f docker/docker-compose.yml up -d
```

### Enter the Container

```bash
docker-compose -f docker/docker-compose.yml exec devenv zsh
```

## Optional Services

DevEnv includes optional database and cache services that you can start using profiles:

### Start with PostgreSQL

```bash
docker-compose -f docker/docker-compose.yml --profile database up -d
```

### Start with all databases

```bash
docker-compose -f docker/docker-compose.yml --profile full up -d
```

## Dotfiles Installation

To use the provided dotfiles on your host system:

1. Backup your existing configurations:
```bash
cp ~/.bashrc ~/.bashrc.backup
cp ~/.zshrc ~/.zshrc.backup
cp ~/.gitconfig ~/.gitconfig.backup
```

2. Copy the dotfiles:
```bash
cp dotfiles/.bashrc ~/
cp dotfiles/.zshrc ~/
cp dotfiles/.gitconfig ~/
```

3. Configure Git with your information:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Customization

### Custom Shell Configuration

You can add custom configurations without modifying the main files:

- For Bash: Create `~/.bashrc.local`
- For Zsh: Create `~/.zshrc.local`
- For Git: Create `~/.gitconfig.local`

These files will be automatically loaded if they exist.

### Custom Docker Configuration

To customize the Docker setup:

1. Copy `docker-compose.yml` to `docker-compose.override.yml`
2. Make your changes in the override file
3. Docker Compose will automatically merge both files

## Verification

After setup, verify your environment:

### Check Docker Container

```bash
docker-compose -f docker/docker-compose.yml ps
```

You should see the `devenv` container running.

### Enter and Test

```bash
./scripts/enter.sh

# Inside the container, verify tools:
python --version
node --version
go version
rustc --version
git --version
```

## Troubleshooting

### Container Won't Start

1. Check Docker daemon is running:
```bash
docker info
```

2. Check for port conflicts:
```bash
docker-compose -f docker/docker-compose.yml ps
netstat -tulanp | grep -E '3000|5000|8000'
```

3. View container logs:
```bash
docker-compose -f docker/docker-compose.yml logs devenv
```

### Permission Issues

If you encounter permission issues with Docker:

```bash
# Add your user to the docker group
sudo usermod -aG docker $USER

# Log out and back in, then verify
docker ps
```

### Build Failures

If the Docker build fails:

1. Check your internet connection
2. Clear Docker cache and rebuild:
```bash
docker-compose -f docker/docker-compose.yml build --no-cache
```

3. Check available disk space:
```bash
df -h
docker system df
```

### Slow Performance

If the environment is slow:

1. Allocate more resources to Docker (in Docker Desktop settings)
2. Use `:cached` or `:delegated` volume mounts
3. Consider using named volumes instead of bind mounts

## Updating

To update DevEnv:

```bash
cd DevEnv
git pull
docker-compose -f docker/docker-compose.yml build --pull
docker-compose -f docker/docker-compose.yml up -d
```

## Uninstallation

To remove DevEnv:

```bash
# Stop and remove containers
docker-compose -f docker/docker-compose.yml down -v

# Remove Docker image
docker rmi devenv:latest

# Remove the repository
cd ..
rm -rf DevEnv

# Optionally restore your original dotfiles
mv ~/.bashrc.backup ~/.bashrc
mv ~/.zshrc.backup ~/.zshrc
mv ~/.gitconfig.backup ~/.gitconfig
```

## Next Steps

- See [USAGE.md](USAGE.md) for common workflows (coming soon)
- Check [CUSTOMIZATION.md](CUSTOMIZATION.md) for customization options (coming soon)
- Review [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for more help (coming soon)

## Support

If you encounter issues:

1. Check the [Troubleshooting](#troubleshooting) section above
2. Review existing [GitHub Issues](https://github.com/yourusername/DevEnv/issues)
3. Open a new issue with:
   - Your OS and version
   - Docker version
   - Error messages
   - Steps to reproduce

---

**Last Updated**: 2025-12-18
**Version**: 0.1.0
