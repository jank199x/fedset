NERD_FONT="SourceCodePro"
FONT_ZIP="${NERD_FONT}.zip"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_ZIP}"
FONT_DIR="$LOCAL_FONTS_DIR/$NERD_FONT"

ensure_dir "$LOCAL_FONTS_DIR"

if [ ! -d "$FONT_DIR" ]; then
    echo "Downloading and installing $NERD_FONT"
    wget -P "$LOCAL_FONTS_DIR" "$FONT_URL"
    unzip "$LOCAL_FONTS_DIR/$FONT_ZIP" -d "$FONT_DIR"
    rm "$LOCAL_FONTS_DIR/$FONT_ZIP"

    echo "Updating font cache and setting GNOME monospace font"
    fc-cache -fv
    gsettings set org.gnome.desktop.interface monospace-font-name 'SauceCodePro NF 12'
fi
