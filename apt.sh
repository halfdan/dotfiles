#!/usr/bin/env bash

# Install command line tools

# Update cache
apt update 

# Upgrade already installed packages
apt upgrade

# Install packages
apt install -y \
    jq \
    neovim \
    ripgrep \
    fzf \
    direnv \
    zsh
