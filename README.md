# Automatically install Firefox Developer Edition
> Also called "Firefox Aurora"
There is no official and automatic way to download, install and integrate Firefox Developer Edition on a Linux system. This is my try at it.

## Prerequisites
- `bash`, `tar` and `curl` have to be installed
  - Fedora-based: `sudo dnf install tar curl`
  - Debian-based: `sudo apt install tar curl`
  - ...

## Usage
```bash
curl "https://raw.githubusercontent.com/julius-boettger/install-firefox-dev-linux/master/install_firefox_dev.sh" | bash -s "en-US"
```
- `"en-US"` is the language in which Firefox will be installed, which has to be provided before starting the installation, as it cannot be changed later!
  - you can change this to your preferred language like `"de-DE"`

## ToDo
- make script safer by checking for present installations etc
- improve README.md
- try `wget` instead of `curl`
- remove `bash` dependency by executing with default shell?
- also provide an uninstall script?
- rename installation folder to `firefox-dev` or `firefox-aurora`
- document how to make an alias to the binary
