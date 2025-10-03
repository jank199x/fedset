install_extension() {
  EXTENSION_NAME=$1
  REPO_NAME=$2
  RELEASE_NAME=$3

  if ! gnome-extensions list | grep -q "$EXTENSION_NAME"; then
    FULL_URL="https://github.com/${REPO_NAME}/releases/latest/download/${RELEASE_NAME}"
    wget -P "$DOWNLOAD_DIR" "$FULL_URL"
    gnome-extensions install --force "$DOWNLOAD_DIR/$RELEASE_NAME"
  fi
}

DOWNLOAD_DIR=$(mktemp -d) || { echo "Failed to create temporary directory"; exit 1; }

install_extension "AlphabeticalAppGrid@stuarthayhurst" "stuarthayhurst/alphabetical-grid-extension" "AlphabeticalAppGrid@stuarthayhurst.shell-extension.zip"
install_extension "appindicatorsupport@rgcjonas.gmail.com" "ubuntu/gnome-shell-extension-appindicator" "appindicatorsupport@rgcjonas.gmail.com.zip"
#install_extension "dash-to-dock@micxgx.gmail.com" "micheleg/dash-to-dock" "dash-to-dock@micxgx.gmail.com.zip"
#TODO: caffeine

rm -r "$DOWNLOAD_DIR"
