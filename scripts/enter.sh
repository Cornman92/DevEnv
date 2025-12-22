#!/usr/bin/env bash

# DevEnv Enter Script
# Quick helper to enter the development environment

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$PROJECT_ROOT"

# Check if container is running
if ! docker-compose -f docker/docker-compose.yml ps devenv | grep -q "Up"; then
    echo "Starting development environment..."
    docker-compose -f docker/docker-compose.yml up -d
    sleep 2
fi

# Enter the container
echo "Entering DevEnv..."
docker-compose -f docker/docker-compose.yml exec devenv zsh
