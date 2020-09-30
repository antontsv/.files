
# If running bash, source .bashrc
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# If running zsh, source .bashrc
if [ -n "$ZSH_VERSION" ] && [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi
