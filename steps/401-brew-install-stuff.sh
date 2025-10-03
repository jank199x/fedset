PACKAGES_TO_INSTALL="
xdg-ninja
"
brew upgrade 
brew install $PACKAGES_TO_INSTALL

echo "Run xdg-ninja with '--skip--ok --skip-unsupported' for less clutter"

