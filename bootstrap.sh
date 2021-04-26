#!/usr/bin/env bash

# Install asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Link files
ln -s ~/.dotfiles/.zshrc .zshrc
ln -s ~/.dotfiles/.zshenv .zshenv
ln -s ~/.dotfiles/.tool-versions .tool-versions
ln -s ~/.dotfiles/.tmux.conf .tmux.conf
ln -s ~/.dotfiles/.vim .vim

# Source zsh
source ~/.zshrc
