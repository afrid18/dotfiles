echo "This is a stow script"
stow -R alacritty bin nvim starship tmux tmuxinator vim git helix --verbose=1
cat ~/dotfiles/zsh/.zshrc >> ~/.zshrc
echo "Successfully stowed----------->"

