# DevEnv

> A comprehensive, containerized developer environment for modern software development

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/docker-ready-blue.svg)](https://www.docker.com/)
[![Status](https://img.shields.io/badge/status-in--development-yellow.svg)](ROADMAP.md)

## Overview

DevEnv is a fully-configured development environment designed to provide a consistent, reproducible, and efficient development experience. Built with containerization at its core, DevEnv reduces setup time from days to minutes and ensures every team member has the same tools and configurations.

### Key Features

- **🚀 Quick Setup**: Get a fully functional development environment in under 10 minutes
- **🐳 Containerized**: Docker-based for consistency and portability
- **🔧 Pre-configured Tools**: Essential development tools configured out of the box
- **🌐 Multi-Language Support**: Python, Node.js, Go, Rust, and more
- **💻 IDE Integration**: VS Code, Vim/Neovim with intelligent configurations
- **☁️ Cloud-Ready**: AWS, GCP, Azure CLI tools included
- **📦 Version Management**: Built-in support for pyenv, nvm, and other version managers
- **🔒 Secure**: Security best practices and secrets management
- **📚 Well-Documented**: Comprehensive guides and examples

## Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/DevEnv.git
cd DevEnv

# Run the setup script (coming soon in v0.1)
./scripts/setup.sh

# Or use Docker Compose
docker-compose up -d
```

## What's Included

### Core Development Tools
- **Shell**: Zsh with Starship prompt
- **Version Control**: Git with useful aliases and hooks
- **Editors**: VS Code configurations, Vim/Neovim setup
- **Languages**: Python, Node.js, Go, Rust
- **Package Managers**: pip, npm, cargo, and more

### Container & Database Tools
- Docker & Docker Compose
- Kubernetes tools (kubectl, k9s, kind)
- PostgreSQL, MySQL, Redis clients
- Container monitoring (lazydocker, ctop)

### Cloud & API Tools
- AWS CLI, GCP SDK, Azure CLI
- HTTPie, curl, jq, yq
- Terraform, Ansible
- API testing tools

### Development Utilities
- Code formatters and linters
- Debugging tools
- Performance profilers
- File search and navigation tools

## Project Documentation

This project includes comprehensive planning and documentation:

- **[PROJECT_PLAN.md](PROJECT_PLAN.md)** - Overall project strategy, goals, and technical approach
- **[ROADMAP.md](ROADMAP.md)** - Timeline, phases, and version planning
- **[MILESTONES.md](MILESTONES.md)** - Key milestones, deliverables, and success criteria
- **[TODO.md](TODO.md)** - Detailed task breakdown by category and priority

### Additional Documentation (Coming Soon)
- **SETUP.md** - Detailed installation instructions
- **USAGE.md** - Common workflows and usage examples
- **CUSTOMIZATION.md** - How to customize your environment
- **TROUBLESHOOTING.md** - Solutions to common issues
- **CONTRIBUTING.md** - Guidelines for contributors

## Project Status

**Current Phase**: Phase 1 - Foundation
**Current Version**: v0.0.1 (Planning)
**Target v1.0 Release**: Week 20

See [ROADMAP.md](ROADMAP.md) for detailed timeline and [MILESTONES.md](MILESTONES.md) for progress tracking.

### Development Progress

- ✅ Project planning and documentation
- [ ] Basic Docker environment (v0.1)
- [ ] Core development tools (v0.2)
- [ ] IDE integration (v0.3)
- [ ] Container and database tools (v0.4)
- [ ] Cloud and API tools (v0.5)
- [ ] Optimization and advanced features (v0.6)
- [ ] Testing and quality assurance (v0.7)
- [ ] Complete documentation (v0.8)
- [ ] Beta release (v0.9)
- [ ] Stable v1.0 release

## Planned Directory Structure

```
DevEnv/
├── docker/                 # Docker configurations
│   ├── Dockerfile
│   └── docker-compose.yml
├── dotfiles/              # Configuration files
│   ├── .zshrc
│   ├── .bashrc
│   ├── .gitconfig
│   └── .vimrc
├── scripts/               # Setup and utility scripts
│   ├── setup.sh
│   ├── install-tools.sh
│   └── update.sh
├── configs/               # Application configurations
│   ├── vscode/
│   ├── git/
│   └── shell/
├── docs/                  # Documentation
│   ├── SETUP.md
│   ├── USAGE.md
│   └── TROUBLESHOOTING.md
├── tests/                 # Environment tests
├── PROJECT_PLAN.md        # Project strategy
├── TODO.md                # Detailed task list
├── MILESTONES.md          # Project milestones
├── ROADMAP.md             # Timeline and phases
└── README.md              # This file
```

## Requirements

### For Docker-based Setup
- Docker 20.10+
- Docker Compose v2+
- 4GB RAM minimum
- 10GB disk space

### For Native Installation (Coming Soon)
- Linux (Ubuntu 22.04+, Debian 12+) or macOS
- Internet connection
- Basic development tools (git, curl)

## Supported Platforms

- ✅ Ubuntu 22.04 LTS
- ✅ Ubuntu 24.04 LTS
- ✅ Debian 12
- ✅ macOS (Intel)
- ✅ macOS (Apple Silicon)
- ✅ Windows WSL2

## Use Cases

DevEnv is perfect for:

- **Individual Developers**: Quickly set up a consistent development environment
- **Development Teams**: Ensure all team members have identical setups
- **New Hires**: Onboard new developers in minutes, not days
- **Multi-Project Work**: Switch between projects with different requirements
- **Teaching/Training**: Provide students with a standardized environment
- **Remote Development**: Consistent environment across multiple machines

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) (coming soon) for guidelines.

### Current Contribution Opportunities

As we're in the planning phase, we're looking for:
- Feedback on the project plan and roadmap
- Suggestions for tools and configurations
- Documentation improvements
- Testing on different platforms (once implemented)

## Roadmap Highlights

### v0.1 (Foundation) - Week 2
Basic Docker environment and project structure

### v0.3 (IDE Integration) - Week 6
VS Code and Vim/Neovim configurations

### v0.5 (Cloud & API Tools) - Week 10
Cloud CLI tools and API testing utilities

### v0.9 (Beta) - Week 18
Beta release for community testing

### v1.0 (Stable) - Week 20
Production-ready stable release

See [ROADMAP.md](ROADMAP.md) for complete timeline.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support & Community

- **Issues**: Report bugs or request features via [GitHub Issues](https://github.com/yourusername/DevEnv/issues)
- **Discussions**: Join the conversation in [GitHub Discussions](https://github.com/yourusername/DevEnv/discussions)
- **Documentation**: Check our comprehensive docs in the `/docs` folder

## Acknowledgments

Inspired by and built upon best practices from:
- [VS Code Dev Containers](https://containers.dev/)
- [GitHub Codespaces](https://github.com/features/codespaces)
- [12 Factor App](https://12factor.net/)
- The open-source community

## Project Metrics

**Total Planned Tasks**: 180+
**Milestones**: 11
**Estimated Timeline**: 20 weeks to v1.0
**Supported Languages**: 4+ (Python, Node.js, Go, Rust)
**Supported Platforms**: 6

---

**Status**: 🟡 In Planning
**Last Updated**: 2025-12-18
**Next Milestone**: M1 - Foundation (Week 2)

For detailed information, see:
- [Project Plan](PROJECT_PLAN.md)
- [Roadmap](ROADMAP.md)
- [Milestones](MILESTONES.md)
- [Task List](TODO.md)