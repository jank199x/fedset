PACKAGES_TO_INSTALL="
io.github.flattool.Warehouse
io.github.dvlv.boxbuddyrs
io.github.zaedus.spider
de.haeckerfelix.Shortwave
com.mattjakeman.ExtensionManager
"
flatpak update -y
flatpak install -y $PACKAGES_TO_INSTALL
