PACKAGES_TO_REMOVE="
gnome-boxes
gnome-tour
gnome-maps
gnome-connections
libreoffice-*
"

sudo dnf remove -y $PACKAGES_TO_REMOVE
