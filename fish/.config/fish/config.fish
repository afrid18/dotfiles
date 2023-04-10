if status is-interactive
    # Commands to run in interactive sessions can go here
end

# initial greeting message
set fish_greeting ""

# terminal color
set -gx TERM xterm-256color


# aliases
alias reload "source ~/.config/fish/config.fish"
alias ls "ls -GF"
alias l "ls -a"
alias ll "ls -al"
alias rm "rm -iIv"
alias python "python3"
alias pip "pip3"
alias tmux "tmux -2"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias saymyname "echo $USER"
alias grep "grep --color=auto"
alias cat "bat"
alias vi 'nvim'

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH


# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH


set -gx PATH /opt/homebrew/bin $PATH

# set environment variables
set -gx GPG_TTY (tty)

# setting prompt to starship
eval (starship init fish)

# setting vi key bindings
fish_vi_key_bindings
