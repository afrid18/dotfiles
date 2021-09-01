autoload -U promptinit # initialize the prompt system promptinit
autoload -Uz compinit && compinit

# SET OPTIONS

setopt autocd

# Adding history file

HISTFILE=~/.zsh_history # sets the location of the history file

# prompt setup

promptinit

# hashes of the frequently used directories

hash -d  codedir=/Users/Imamkhaja/Desktop/practice
hash -d musicdir=/Users/imamkhaja/Music

# Change the prompt

PROMPT='%F{228}%BAfrid%f %2~%b'
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
alias saymyname="echo $USERNAME"
alias gcc=gcc-11
alias g++=g++-11

# BIND KEYS

bindkey -v

# PATHS

# adding ~/bin path for my personal executables
export PATH=~/bin:$PATH

# ADDING C INCLUDE PATH AND LIBRARY PATH ##FOR MACBOOK USERS USING HOMEBREW AS THE PACKAGE MANAGER


C_INCLUDE_PATH=.:/opt/homebrew/include
LIBRARY_PATH=.:/opt/homebrew/lib
export C_INCLUDE_PATH
export LIBRARY_PATH

# for RUBY libs
export SDKROOT=$(xcrun --show-sdk-path)
# for ruby
export PATH=/opt/homebrew/opt/ruby/bin:$PATH

# Adding vim like zsh experience using zsh-vi-mode plugin
# bindkey -v

# source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh



# A CUSTOM FUNCTION TO DISPLAY ALL THE COLORS AVAILABLE

disco() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}m${i}\t"
    done
    printf '\n'
}

# A custom function to copy all my major configs to .myconfigs
copy_configs() {
    cp ~/.zshrc ~/.myconfigs/.zshrc
    cp ~/.tmux.conf ~/.myconfigs/.tmux.conf
    cp ~/.vimrc ~/.myconfigs/.vimrc
}

# Created by `pipx` on 2021-06-18 12:18:44
export PATH="$PATH:/Users/imamkhaja/.local/bin"

# Created by `pipx` on 2021-06-18 12:18:44
export PATH="$PATH:/Users/imamkhaja/Library/Python/3.9/bin"



# LLVM paths etc....
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

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
