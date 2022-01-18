#!/usr/bin/env bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

# Install asdf plugins
asdf plugin add python
asdf plugin add golang

# Install rustup toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Link files
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.zshenv ~/.zshenv
ln -s ~/.dotfiles/.tool-versions ~/.tool-versions
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/i3 ~/.config/i3
ln -s ~/.dotfiles/.config/i3status ~/.config/i3status
ln -s ~/.dotfiles/.config/alacritty ~/.config/alacritty

# Source zsh
source ~/.zshrc
