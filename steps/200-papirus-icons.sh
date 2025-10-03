if [ ! -d /usr/share/icons/Papirus ]; then
sudo dnf install -y papirus-icon-theme && gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
fi
