#!/usr/bin/env bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Link files
ln -s ~/.dotfiles/.zshrc .zshrc
ln -s ~/.dotfiles/.zshenv .zshenv
ln -s ~/.dotfiles/.tool-versions .tool-versions
ln -s ~/.dotfiles/.tmux.conf .tmux.conf
ln -s ~/.dotfiles/.vim .vim
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim

# Source zsh
source ~/.zshrc
