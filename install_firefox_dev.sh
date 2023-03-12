#!/bin/bash
# make sure curl and tar are installed
sudo apt install curl
sudo apt install tar
# download firefox archive to /opt/
sudo curl --location "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" --output /opt/firefox.tar.bz2
# expand the archive in /opt/
sudo tar -xjf /opt/firefox.tar.bz2 -C /opt/
# delete the archive
sudo rm -rf /opt/firefox.tar.bz2
# make current user owner of firefox/
sudo chown -R $USER /opt/firefox
# write shortcut file
cat > ~/.local/share/applications/firefox_dev.desktop << EOF
[Desktop Entry]
Name=Firefox Developer Edition
GenericName=Firefox Developer Edition
Exec=/opt/firefox/firefox %u
Terminal=false
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Type=Application
Categories=Application;Network;X-Developer;
Comment=Mozilla Firefox Developer Edition Web Browser
StartupWMClass=firefox-aurora

EOF
# end shortcut file
# mark shortcut file as trusted and make it executable
chmod +x ~/.local/share/applications/firefox_dev.desktop
