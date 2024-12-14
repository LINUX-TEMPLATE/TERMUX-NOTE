#!/bin/bash

# Installation script for PROOT-DISTRO environment
# Repository: LINUX-TEMPLATE/TERMUX-NOTE
# File: script.sh

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Function to print status
print_status() {
    echo -e "${BLUE}[*] $1${NC}"
}

# Function to print success
print_success() {
    echo -e "${GREEN}[✓] $1${NC}"
}

# Error handling
set -e
trap 'echo "Error on line $LINENO"' ERR

# Main installation process
main() {
    print_status "Starting installation..."
    
    # Setup Termux
    print_status "Setting up Termux..."
    pkg update -y && pkg upgrade -y
    termux-setup-storage
    pkg install proot-distro -y
    print_success "Termux setup completed"

    # Install Ubuntu
    print_status "Installing Ubuntu..."
    proot-distro install ubuntu-oldlts
    
    # Configure Ubuntu environment
    proot-distro login ubuntu-oldlts -- bash -c '
        print_status "Configuring Ubuntu..."
        apt update -y && apt upgrade -y
        apt install -y neofetch git

        print_status "Installing Go..."
        wget https://go.dev/dl/go1.23.3.linux-arm64.tar.gz
        tar -C /usr/local -xzf go1.23.3.linux-arm64.tar.gz

        print_status "Setting up Go environment..."
        echo "export GOROOT=/usr/local/go" >> ~/.bashrc
        echo "export GOPATH=\$HOME/go" >> ~/.bashrc
        echo "export PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH" >> ~/.bashrc
        source ~/.bashrc

        rm go1.23.3.linux-arm64.tar.gz
        print_success "Ubuntu configuration completed"
    '
    
    print_success "Installation completed successfully!"
}

# Execute main function
main "$@"