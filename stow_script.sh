#!/bin/bash

cat <<'EOF'



M""""""'YMM                   MM""""""""`M                   MP""""""`MM            dP                     
M  mmmm. `M                   MM  mmmmmmmM                   M  mmmmm..M            88                     
M  MMMMM  M .d8888b. dP   .dP M`      MMMM 88d888b. dP   .dP M.      `YM .d8888b. d8888P dP    dP 88d888b. 
M  MMMMM  M 88ooood8 88   d8' MM  MMMMMMMM 88'  `88 88   d8' MMMMMMM.  M 88ooood8   88   88    88 88'  `88 
M  MMMM' .M 88.  ... 88 .88'  MM  MMMMMMMM 88    88 88 .88'  M. .MMM'  M 88.  ...   88   88.  .88 88.  .88 
M       .MM `88888P' 8888P'   MM        .M dP    dP 8888P'   Mb.     .dM `88888P'   dP   `88888P' 88Y888P' 
MMMMMMMMMMM                   MMMMMMMMMMMM                   MMMMMMMMMMM                          88       
                                                                                                  88


EOF


# OS agnostic setup (only for liux and macos) never bother about windows

# if the system if either linux or macos, install brew and install brewfile contents
# checking for the operating system
echo "-> Checking for the operating system"

# if os is macos or linux do
if [ "$(uname)" == "Darwin" ]; [ "$(uname)" == "Linux" ]; then
    echo "-> Operating System is MacOS"
    echo "[ ] Checking for Homebrew"

    # check if homebrew is installed, if not install it
    if [ -x "$(command -v brew)" ]; then
        echo "-> Homebrew is installed"
    else
        echo "-> Homebrew is not installed"
        echo "..... Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # check if brewfile exists, if exists install all the brew formulas and casks
    if [ -e "Brewfile" ]; then
        echo "-> Brewfile exists"
        echo "..... Installing formulas and casks from Brewfile"
        brew bundle
    else
        echo "-> Brewfile does not exist"
    fi
fi

# Looking for antigen and if not found getting one from internet
echo "[ ] Checking antigen for Zsh"
antigenPath="$HOME/.config/zsh/antigen.zsh"

if [ -e "$antigenPath" ]; then
    echo "-> Antigen Exists"
else
    echo "-> Antigen not found"
    echo "..... Installing Antigen for Zsh"
    mkdir -p $HOME/.config/zsh
    curl -L git.io/antigen > $HOME/.config/zsh/antigen.zsh
fi

stow -R kitty alacritty starship tmux vim git zsh nvim --verbose=1 --target=$HOME
echo "Successfully stowed----------->"

