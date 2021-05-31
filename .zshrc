autoload -U promptinit # initialize the prompt system promptinit

# SET OPTIONS

setopt autocd

# Adding history file

HISTFILE=~/.zsh_history # sets the location of the history file

# prompt setup

promptinit

# hashes of the frequently used directories

hash -d  codedir=/Users/Imamkhaja/Desktop/practice

# Change the prompt

PROMPT='%F{228}%BAfrid%f %2~  %# %b'
RPS1="%F{red}%(?..(%?%))%f"

# ALIASES

alias reload='source ~/.zshrc'
alias ls='ls -GF'
alias l='ls -a'
alias ll='ls -al'
alias python='python3'
alias pip='pip3'
alias tmux='tmux -2'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# BIND KEYS

bindkey -v


# PATHS

export PATH=$PATH:'/Applications/kate.app/Contents/MacOS'

# ADDING C INCLUDE PATH AND LIBRARY PATH ##FOR MACBOOK USERS USING HOMEBREW AS THE PACKAGE MANAGER


C_INCLUDE_PATH=/opt/homebrew/include
LIBRARY_PATH=/opt/homebrew/lib
export C_INCLUDE_PATH
export LIBRARY_PATH
