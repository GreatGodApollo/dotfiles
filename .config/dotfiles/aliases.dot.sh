#!/bin/bash

# Unbork prezto things
unalias o 2>/dev/null

alias rs='source ~/.zshrc;'

# Navigation
alias ~='cd ~'
alias h='cd ~'
alias ..='cd ..'
alias pj='cd ~/Projects/'
alias dt='cd ~/Desktop'
alias dl='cd ~/Downloads'

# Confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Neovim it all
alias vi='nvim'
alias vim='nvim'
alias v='nvim'

# Sane defaults
alias grep='grep --exclude-dir=node_modules'
alias ls='ls --color=auto'

# Fix all my mistakes
eval $(thefuck --alias)

# Make QSR & Lunar use ~/.config
alias lunar='lunar --config ~/.config/lunar.yaml'
alias qsr='qsr --config ~/.config/qsr.json'
