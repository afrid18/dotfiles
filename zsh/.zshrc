# AUTO COMPLETE FOR SMALL CASE
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# # autoload to load the completion scripts
# autoload -U compinit && compinit

# Set the ZDOTDIR to the home directory
export ZDOTDIR="${HOME}"

# Clone antidote if necessary.
[[ -e ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# Source antidote.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Initialize antidote's dynamic mode, which changes `antidote bundle`
# from static mode.
source <(antidote init)

# all the plugins that I use with antidote
antidote bundle agkozak/zsh-z
antidote bundle greymd/docker-zsh-completion
antidote bundle zsh-users/zsh-autosuggestions
antidote bundle zsh-users/zsh-completions
antidote bundle zsh-users/zsh-syntax-highlighting # Plugin for syntax highlighting
antidote bundle getantidote/use-omz
antidote bundle ohmyzsh/ohmyzsh path:plugins/git
antidote bundle ohmyzsh/ohmyzsh path:plugins/docker
antidote bundle ohmyzsh/ohmyzsh path:plugins/docker-compose
antidote bundle ohmyzsh/ohmyzsh path:plugins/kubectl


# autoload to load the completion scripts
autoload -U compinit && compinit

# hashes of the frequently used directories
hash -d codedir='/Users/imamkhaja/practice'
hash -d testdir='/Users/imamkhaja/practice/test'

# Change the prompt
# PROMPT='%F{228}%BAfrid%f %2~%b'
# RPS1="%F{red}%(?..(%?%))%f"

# ALIASES
alias reload='source ~/.zshrc'
alias ls='ls -GF --color'
alias l='ls -a'
alias ll='ls -al'
alias rm='rm -iIv'
alias python='python3'
# if command -v python3.12 >/dev/null  2>&1; then
#     alias python='python3.12'
# fi
alias pip='pip3'
alias tmux='tmux -2'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias saymyname="echo $USERNAME"
alias gcc=gcc-13
alias g++=g++-13
alias grep='grep --color=auto'
alias cat=bat
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias clear='clear -x'

# Adding alias for gmake as make
alias vi=nvim  #starting to use Neovim as my default editor
alias vim=nvim

#################### BIND KEYS
bindkey -v # Enter into vim mode
bindkey "^B" history-incremental-pattern-search-backward # Just click ctrl + r to enter into incremental search

# Vim mode search in normal mode
bindkey -M vicmd '/' history-incremental-pattern-search-backward # Pattern based incremental backward search in vim mode
bindkey -M vicmd '?' history-incremental-pattern-search-forward # Pattern based incremental forward search in vim mode

# vim mode search in insert mode to surf through queue
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

export EDITOR=nvim  # Default editor

# C library variabls exported (installed from Brew package manager)
C_INCLUDE_PATH=.:/opt/homebrew/include # ADDING C INCLUDE PATH AND LIBRARY PATH 
LIBRARY_PATH=.:/opt/homebrew/lib # add Library path from homebrew package manager
export C_INCLUDE_PATH
export LIBRARY_PATH


# PATHS
export PATH="/opt/homebrew/sbin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH
# Adding go path
export GOPATH=~/go
export GOBIN=~/go/bin
export PATH=$GOPATH:$GOBIN:$PATH 

export PATH=/Users/imamkhaja/.gem/ruby/2.1.0:$PATH                    # Ruby gems path
export PATH=/Users/imamkhaja/.local/share/gem/ruby/3.1.0:$PATH        # Ruby gems path
export PATH=/opt/homebrew/Cellar/ruby/3.1.1/lib/ruby/gems/3.1.0:$PATH # Ruby gems path

export TERM=xterm-256color

# A CUSTOM FUNCTION TO DISPLAY ALL THE COLORS AVAILABLE
disco() {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}m${i}\t"
  done
  printf '\n'
}

# A custom function to get weather
weather() {
  local place="$1"
  if [[ -z "$1" ]]; then
    echo "no args provided. Please give a Place!"
    return 1
  fi
  local base_string="wttr.in/$1"
  curl $base_string
}

# Copy present dir
cpdir() {
  pwd | pbcopy
}


# Environment Variables(Custom defined)
export GPG_TTY=$(tty) # For GnuPG
#export GREP_COLOR='ms=01;04;25;36'

# start starship
eval "$(starship init zsh)"
