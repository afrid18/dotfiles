echo "Setting up MacOS for Afrid Hussain"
echo "This is a stow script"

# Looking for antigen and if not found getting one from internet
echo "-> Checking antigen for Zsh"
antigenPath="$HOME/.config/zsh/antigen.zsh"

if [ -e "$antigenPath" ]; then
    echo "-> Antigen Exists"
else
    echo "-> Antigen doesn't exist"
    echo "-> Pulling antigen from internet!"
    mkdir -p $HOME/.config/zsh
    curl -L git.io/antigen > $HOME/.config/zsh/antigen.zsh
fi

stow -R kitty alacritty starship tmux vim git zsh nvim --verbose=1 --target=$HOME
echo "Successfully stowed----------->"

