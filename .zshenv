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

## Second Measure
alias pa="aws-okta exec prod-admin -- "
alias pe="aws-okta exec prod-eng -- "
alias da="aws-okta exec dev-admin -- "
alias de="aws-okta exec dev-eng -- "
alias s3="aws s3"
alias kg="kubectl get "
alias kd="kubectl describe "
alias ke="kubectl edit "
alias ctx="kubectx"
alias ctl="kubectl"

# zsh-autosuggest
bindkey '^ ' autosuggest-accept

## Push command / pop command
#zle-line-init() if [[ $CONTEXT = start ]] LBUFFER=$zle_prefix$LBUFFER
#zle -N zle-line-init
#prime-zle-prefix() zle_prefix=$LBUFFER
#zle -N prime-zle-prefix
#bindkey '\eP' prime-zle-prefix
