#!/bin/bash

source helper/sscmd.sh
source helper/vars.sh
source helper/utils.sh

mkdir -p download
cd download

call_seperator
echo -e "${Red}Step 1${NC}: install chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpki -i google-chrome*.deb

call_seperator
echo -e "${Red}Step 2${NC}: install terminator"
sudo apt install terminator

call_seperator
echo -e "${Red}Step 3${NC}: install screenfetch"
sudo apt install screenfetch

call_seperator
echo -e "${Red}Step 4${NC}: install unity-tweak-tool"
sudo apt install unity-tweak-tool

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
