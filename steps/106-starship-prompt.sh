STARSHIP_BINARY="starship"
STARSHIP_TAR="starship-x86_64-unknown-linux-gnu.tar.gz"
STARSHIP_URL="https://github.com/starship/starship/releases/latest/download/${STARSHIP_TAR}"
STARSHIP_RC_FILE="$BASH_CONFIG_DIR/99-starship-prompt.bashrc"

ensure_dir "$LOCAL_BIN_DIR"

if [ ! -f "$STARSHIP_RC_FILE" ]; then
    echo "Downloading and installing Starship"
    wget -P "$LOCAL_BIN_DIR" "$STARSHIP_URL"
    tar -xzf "$LOCAL_BIN_DIR/$STARSHIP_TAR" -C "$LOCAL_BIN_DIR"
    rm "$LOCAL_BIN_DIR/$STARSHIP_TAR"

    echo "Creating Starship bashrc file"
    cat > "$STARSHIP_RC_FILE" << 'EOF'
eval "$(starship init bash)"
EOF
fi
