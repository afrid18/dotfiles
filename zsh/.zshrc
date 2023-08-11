# Antigen plugin manager
source ~/.config/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen bundle agkozak/zsh-z
antigen bundle command-not-found
antigen bundle git
antigen bundle greymd/docker-zsh-completion
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting # Plugin for syntax highlighting
antigen use oh-my-zsh

# End of antigen
antigen apply

autoload -U compinit && compinit

# hashes of the frequently used directories
hash -d  codedir='/Users/imamkhaja/practice'
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

export EDITOR=vim  # Default editor

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
export PATH=~/go/bin/:$PATH # Adding go path
export PATH=/Users/imamkhaja/.gem/ruby/2.1.0:$PATH                    # Ruby gems path
export PATH=/Users/imamkhaja/.local/share/gem/ruby/3.1.0:$PATH        # Ruby gems path
export PATH=/opt/homebrew/Cellar/ruby/3.1.1/lib/ruby/gems/3.1.0:$PATH # Ruby gems path



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

# AUTO COMPLETE FOR SMALL CASE
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# GIT PROMPT
# autoload -Uz add-zsh-hook
# autoload -Uz add-zsh-hook vcs_info
# setopt prompt_subst
# add-zsh-hook precmd vcs_info
# zstyle ':vcs_info:git:*' formats       ' git:(%b%u%c)'
# zstyle ':vcs_info:git:*' actionformats ' git:(%b|%a%u%c)'
# PROMPT+='%B%F{red}${vcs_info_msg_0_}%f %# %b'
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' unstagedstr ' *'
# zstyle ':vcs_info:*' stagedstr ' +'


# Copy present dir
cpdir() {
    pwd | pbcopy
}


# Environment Variables(Custom defined)
export GPG_TTY=$(tty) # For GnuPG
#export GREP_COLOR='ms=01;04;25;36'

# Starship command prompt
eval "$(starship init zsh)"

# oh-my-zsh completion plugins and other plugins
plugins=(
  git
  docker
  docker-compose
  kubectl
  heroku
  zsh-autosuggestions
)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/imamkhaja/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/imamkhaja/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/imamkhaja/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/imamkhaja/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

