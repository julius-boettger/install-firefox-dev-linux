# make sure curl and tar are installed
sudo apt install curl
sudo apt install tar
# copy local shortcut file firefox_dev.desktop to Desktop/
cp firefox_dev.desktop ~/Desktop/
# go to desktop
cd ~/Desktop/
# download firefox
curl --location "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" --output firefox.tar.bz2
# copy to /opt
sudo cp -rp firefox.tar.bz2 /opt
# delete archive on desktop
rm -rf firefox.tar.bz2
# go to /opt
cd /opt/
# expand the archive
sudo tar xjf firefox.tar.bz2
# delete the archive
sudo rm -rf firefox.tar.bz2
# make myself owner of firefox/
sudo chown -R $USER /opt/firefox
# copy shortcut file firefox_dev.desktop to appropriate location
cp ~/Desktop/firefox_dev.desktop ~/.local/share/applications/
# delete shortcut file firefox_dev.desktop in Desktop/
rm ~/Desktop/firefox_dev.desktop
# mark shortcut as trusted and make it executable
chmod +x ~/.local/share/applications/firefox_dev.desktop

