#!/usr/bin/env bash

# Installation script for Modern Neovim Configuration
# Migrated from VitaVim

set -e

echo "🚀 Installing Modern Neovim Configuration"
echo "=========================================="

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}Error: Neovim is not installed.${NC}"
    echo "Please install Neovim >= 0.9.0 first."
    echo "Visit: https://github.com/neovim/neovim/releases"
    exit 1
fi

# Check Neovim version
NVIM_VERSION=$(nvim --version | head -n 1 | grep -oP '\d+\.\d+\.\d+' | head -1)
echo -e "${GREEN}✓${NC} Found Neovim version: $NVIM_VERSION"

# Backup existing configuration
NVIM_CONFIG="$HOME/.config/nvim"
NVIM_DATA="$HOME/.local/share/nvim"

if [ -d "$NVIM_CONFIG" ]; then
    BACKUP_DIR="$NVIM_CONFIG.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}⚠${NC}  Existing Neovim config found. Backing up to: $BACKUP_DIR"
    mv "$NVIM_CONFIG" "$BACKUP_DIR"
fi

if [ -d "$NVIM_DATA" ]; then
    BACKUP_DATA="$NVIM_DATA.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}⚠${NC}  Existing Neovim data found. Backing up to: $BACKUP_DATA"
    mv "$NVIM_DATA" "$BACKUP_DATA"
fi

# Create config directory
mkdir -p "$HOME/.config"

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy configuration
echo "📦 Copying configuration files..."
cp -r "$SCRIPT_DIR" "$NVIM_CONFIG"
echo -e "${GREEN}✓${NC} Configuration copied to $NVIM_CONFIG"

# Check for optional dependencies
echo ""
echo "Checking optional dependencies..."
echo "================================="

check_command() {
    if command -v $1 &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 is installed"
        return 0
    else
        echo -e "${YELLOW}⚠${NC}  $1 is not installed (optional but recommended)"
        return 1
    fi
}

check_command "git"
check_command "rg"
check_command "node"
check_command "python3"

echo ""
echo "🎉 Installation complete!"
echo ""
echo "Next steps:"
echo "==========="
echo "1. Launch Neovim: nvim"
echo "2. Wait for plugins to install (this happens automatically)"
echo "3. Run :Mason to install LSP servers"
echo "4. Install optional tools:"
echo "   - Python: pip install black isort ruff pytest"
echo "   - Node.js formatters: npm install -g prettier"
echo ""
echo "📚 See README.md for full documentation and key mappings"
echo ""
echo "Original VitaVim by Mohammad Rafi"
echo "Migrated to modern Neovim with Lua"
