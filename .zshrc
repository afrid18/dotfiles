autoload -U promptinit # initialize the prompt system promptinit

# Adding history file

HISTFILE=~/.zsh_history # sets the location of the history file

# prompt setup
promptinit

# codedir is a coding directory for all my purposes
export codedir=/Users/Imamkhaja/Desktop/practice

# Change the prompt
PROMPT='%F{228}%BAfrid%f %2~  %# %b'
RPS1="%F{red}%(?..(%?%))%f"

alias reload='source ~/.zshrc'
alias ls='ls -GF'
alias l='ls -a'
alias ll='ls -al'
alias python='python3'
alias pip='pip3'


bindkey -v
