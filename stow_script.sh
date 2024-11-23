echo "Setting up MacOS for Afrid Hussain"
echo "This is a stow script"
stow -R kitty alacritty starship tmux vim git zsh nvim --verbose=1 --target=$HOME
echo "Successfully stowed----------->"

