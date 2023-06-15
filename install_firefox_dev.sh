#!/bin/bash

# escape codes for colorful output
NC="\e[0m" # no color
RED="\e[31m"
GREEN="\e[32m"

printf "downloading firefox developer edition. "

# set $LOCALE to first argument
LOCALE="$1"

# set $LOCALE to default value if there are no arguments
if [ $# -eq 0 ]; then
    LOCALE="en-US"
    printf "no locale received, using default value \"${LOCALE}\"...\r\n\n"
else
    printf "using first argument \"${LOCALE}\" as locale...\r\n\n"
fi

# download firefox archive to /opt/
sudo curl --location "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=${LOCALE}" --output /opt/firefox.tar.bz2

printf "\n${GREEN}downloaded archive.${NC}\r\n\n"

printf "expanding archive...\r\n"
# expand the archive in /opt/
sudo tar -xjf /opt/firefox.tar.bz2 -C /opt/
printf "${GREEN}archive expanded.${NC}\r\n\n"

# delete the archive
sudo rm -rf /opt/firefox.tar.bz2
printf "${GREEN}deleted archive.${NC}\r\n"

# make current user owner of firefox/
sudo chown -R $USER /opt/firefox
printf "${GREEN}made \"$(whoami)\" owner of /opt/firefox.${NC}\r\n"

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

printf "${GREEN}wrote shortcut file.${NC}\r\n"

# mark shortcut file as trusted and make it executable
chmod +x ~/.local/share/applications/firefox_dev.desktop
printf "${GREEN}marked shortcut as trusted and made it executable.${NC}\r\n"

printf "\n${GREEN}installation complete.${NC}\r\n"

