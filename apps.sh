#!/bin/bash

source helper/sscmd.sh
source helper/vars.sh
source helper/utils.sh

call_seperator
#echo -e "${Red}Step 1${NC}: install chrome"
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpki -i google-chrome*.deb
#rm google-chrome*.deb

call_seperator
echo -e "${Red}Step 2${NC}: install terminator"
sudo apt install terminator
cp ./template/terminator/config ~/.config/terminator/config
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

call_seperator
echo -e "${Red}Step 3${NC}: install screenfetch"
sudo apt install screenfetch

call_seperator
echo -e "${Red}Step 4${NC}: she walks in beauty"
sudo apt install unity-tweak-tool
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle
sudo apt-get install compizconfig-settings-manager

call_seperator
echo -e "${Red}Step 5${NC}: install htop"
sudo apt install htop

call_seperator
echo -e "${Red}Step 6${NC}: install redis server"
sudo apt install redis-server

call_seperator
echo -e "${Red}Step 7${NC}: install postgresql"
sudo apt install python3-pip python-dev libpq-dev postgresql postgresql-contrib

call_seperator
echo -e "${Green}Done!${NC}"
echo ""

source helper/uscmd.sh
