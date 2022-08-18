# Antigen plugin manager
source ~/.config/zsh/antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle marlonrichert/zsh-autocomplete@main

# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply


# End of antigen




autoload -U promptinit # initialize the prompt system promptinit
autoload -Uz compinit && compinit

# SET OPTIONS
setopt autocd

# Adding history file
HISTFILE=~/.zsh_history # sets the location of the history file

# prompt setup
promptinit

# hashes of the frequently used directories
hash -d  codedir=/Users/Imamkhaja/practice
hash -d musicdir=/Users/imamkhaja/Music

# Change the prompt
PROMPT='%F{228}%BAfrid%f %2~%b'
RPS1="%F{red}%(?..(%?%))%f"

# ALIASES
alias reload='source ~/.zshrc'
alias ls='ls -GF'
alias l='ls -a'
alias ll='ls -al'
alias rm='rm -iIv'
alias python='python3'
alias pip='pip3'
alias tmux='tmux -2'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias saymyname="echo $USERNAME"
alias gcc=gcc-11
alias g++=g++-11
alias grep='grep --color=auto'

# Adding alias for gmake as make
alias make=gmake
alias vi=lvim # starting to use Neovim as my default editor
alias vim=lvim 

# BIND KEYS
bindkey -v

# PATHS
# adding ~/bin path for my personal executables
export PATH=~/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export EDITOR=vim

# ADDING C INCLUDE PATH AND LIBRARY PATH ##FOR MACBOOK USERS USING HOMEBREW AS THE PACKAGE MANAGER
C_INCLUDE_PATH=.:/opt/homebrew/include
LIBRARY_PATH=.:/opt/homebrew/lib
export C_INCLUDE_PATH
export LIBRARY_PATH

# Ruby gems paths
export PATH=/Users/imamkhaja/.gem/ruby/2.1.0:$PATH
export PATH=/Users/imamkhaja/.local/share/gem/ruby/3.1.0:$PATH
export PATH=/opt/homebrew/lib/ruby/gems/3.1.0:$PATH
export PATH=/opt/homebrew/Cellar/ruby/3.1.1/lib/ruby/gems/3.1.0:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH="/Users/imamkhaja/.local/share/solana/install/active_release/bin:$PATH"
export PATH="/Users/imamkhaja/bin/:$PATH"
export PATH="/Users/imamkhaja/.local/bin/:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"


# A CUSTOM FUNCTION TO DISPLAY ALL THE COLORS AVAILABLE
disco() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}m${i}\t"
    done
    printf '\n'
}


# AUTO COMPLETE FOR SMALL CASE
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# GIT PROMPT
autoload -Uz add-zsh-hook
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats       ' git:(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats ' git:(%b|%a%u%c)'
PROMPT+='%B%F{red}${vcs_info_msg_0_}%f %# %b'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'


# Copy present dir
cpdir() {
    pwd | pbcopy
}


# Environment Variables(Custom defined)
export GPG_TTY=$(tty) # For GnuPG
#export GREP_COLOR='ms=01;04;25;36'

# Starship command prompt
eval "$(starship init zsh)"

# Heroku CLI autocomplete 

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/imamkhaja/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
