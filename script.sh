#!/bin/bash

# Installation script for PROOT-DISTRO environment

# Setup Termux
echo "Setting up Termux..."
pkg update -y && pkg upgrade -y
termux-setup-storage
pkg install proot-distro -y

# Install Ubuntu
echo "Installing Ubuntu..."
proot-distro install ubuntu-oldlts
proot-distro login ubuntu-oldlts -- bash -c '
    # Update Ubuntu System
    echo "Updating Ubuntu system..."
    apt update -y && apt upgrade -y

    # Install Required Packages
    echo "Installing required packages..."
    apt install -y neofetch git

    # Install Go Programming Language
    echo "Installing Go..."
    wget https://go.dev/dl/go1.23.3.linux-arm64.tar.gz
    tar -C /usr/local -xzf go1.23.3.linux-arm64.tar.gz

    # Configure Go Environment
    echo "Configuring Go environment..."
    echo "export GOROOT=/usr/local/go" >> ~/.bashrc
    echo "export GOPATH=\$HOME/go" >> ~/.bashrc
    echo "export PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH" >> ~/.bashrc
    source ~/.bashrc

    # Cleanup
    echo "Cleaning up..."
    rm go1.23.3.linux-arm64.tar.gz

    echo "Installation completed successfully!"
'