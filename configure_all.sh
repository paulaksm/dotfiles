#!/bin/bash
# add user to /etc/sudoers with <username>  ALL=(ALL)  ALL

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential 
sudo apt install vim python3-pip pinta screen git htop

# CONFIG VIM
dd of=~/.vimrc << EOF
set nu 
syntax on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
EOF

# ADD CAPS LOCK INDICATOR
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'http://launchpadlibrarian.net/244935901/indicator-keylock_3.1.0_amd64.deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

# ADD SPOTIFY
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# ADD SUBLIME
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get install sublime-text

# CONFIG SUBLIME
dd of=~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings << EOF
{
	"detect_indentation": true,
	"tab_size": 4,
	"translate_tabs_to_spaces": true,
    	"font_size": 13,
        "dpi_scale": 1.1

}
EOF

dd of=~/.config/sublime-text-3/Packages/User/Python3.sublime-build << EOF
{
    "cmd": ["python3", "-i", "-u", "$file"],
    "file_regex": "^[ ]File \"(...?)\", line ([0-9]*)",
    "selector": "source.python"
}
EOF

