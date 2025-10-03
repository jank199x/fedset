FZF_REPO="https://github.com/junegunn/fzf.git"
FZF_DIR="$LOCAL_OPT_DIR/fzf"
FZF_RC_FILE="$BASH_CONFIG_DIR/01-fzf.bashrc"

if [ ! -d "$FZF_DIR" ]; then
    git clone --depth 1 "$FZF_REPO" "$FZF_DIR"
    sudo -u "${USER}" "$FZF_DIR/install"
    mv "$HOME/.fzf.bash" "$FZF_RC_FILE"
fi
