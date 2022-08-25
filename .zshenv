# Default Programs
export BROWSER="chromium"
export EDITOR="nvim"
export PAGER="less"
export VISUAL="$EDITOR"
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*}"'

# Aliases
alias dc="docker-compose"
alias vim="nvim"
alias v="nvim"
alias wget="wget -q -c -w 3 --show-progress"
alias p="python"
alias va=". .venv/bin/activate"

alias aoeu="asdf" 
alias update-nvim-nightly='asdf uninstall neovim nightly && asdf install neovim nightly'

# zsh-autosuggest
bindkey '^ ' autosuggest-accept

## Push command / pop command
#zle-line-init() if [[ $CONTEXT = start ]] LBUFFER=$zle_prefix$LBUFFER
#zle -N zle-line-init
#prime-zle-prefix() zle_prefix=$LBUFFER
#zle -N prime-zle-prefix
#bindkey '\eP' prime-zle-prefix
