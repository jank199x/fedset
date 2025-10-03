if [ ! -d "$HOME/.xdg" ]; then
mkdir $HOME/.xdg
rm $HOME/.config/user-dirs.dirs
cat > "$HOME/.config/user-dirs.dirs" << 'EOF'
XDG_DESKTOP_DIR="$HOME/.xdg/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/.xdg/Templates"
XDG_PUBLICSHARE_DIR="$HOME/.xdg/Public"
XDG_DOCUMENTS_DIR="$HOME/.xdg/Documents"
XDG_MUSIC_DIR="$HOME/.xdg/Music"
XDG_PICTURES_DIR="$HOME/.xdg/Pictures"
XDG_VIDEOS_DIR="$HOME/.xdg/Videos"

EOF
mv $HOME/Desktop $HOME/Templates $HOME/Public $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Videos $HOME/.xdg/
fi
