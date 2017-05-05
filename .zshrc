# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Theme for zsh, for more, look in ~/.oh-my-zsh/themes
ZSH_THEME="gallois"

# Plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# Put aliases here
alias ls='ls --color=auto'
alias ll='ls -lA'
alias la='ls -A'

# Reload your zsh
alias reload='. ~/.zshrc'

# Change to these directories
alias wspc='cd ~/workspace'
alias gosrc='cd ~/go/src'
alias alex-chou='cd ~/go/src/github.com/alex-chou'
alias dotfiles='cd ~/workspace/dotfiles'
