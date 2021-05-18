# Oh My ZSH
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-autosuggestions
)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Path settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:~/.local/bin
export PATH=/usr/local/bin/:$PATH

# history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# completion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES

# goodies
eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
eval "$(starship init zsh)"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
