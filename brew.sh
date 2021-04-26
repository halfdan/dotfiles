#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

brew install git
brew install nvim
brew install ripgrep
brew install fzf
brew install direnv
brew install pyenv
brew install starship
brew install jq
