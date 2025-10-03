if [ -f "$HOME/.bashrc" ] && [ ! -f "$HOME/.bashrc.bak" ]; then
    mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi

cat > "$HOME/.bashrc" << 'EOF'
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.config/bash ]; then
    for rc in ~/.config/bash/*.bashrc; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
EOF

ensure_dir "$BASH_CONFIG_DIR"
