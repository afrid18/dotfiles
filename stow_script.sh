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
    curl -L git.io/antigen > $HOME/.config/zsh/antigen.zsh
fi

stow -R alacritty starship tmux tmuxinator vim git helix zsh fish nvim --verbose=1
echo "Successfully stowed----------->"

