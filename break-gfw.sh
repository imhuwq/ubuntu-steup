#!/bin/bash

source vars.sh
source utils.sh
source sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install shadowsocks-qt5"
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt update
sudo apt install shadowsocks-qt5

call_seperator
echo -e "${Red}Step 2${NC}: install privoxy"
sudo apt install privoxy
update_file /etc/privoxy/config 'forward-socks5 / 127.0.0.1:1080 .' sudo
sudo service privoxy restart

call_seperator
echo -e "${Red}Step 3${NC}: install proxychains"
sudo apt install proxychains
sudo sed -i -E "s/socks4\s+127.0.0.1\s+9050/# socks4 127.0.0.1 9050/" /etc/proxychains.conf
update_file /etc/proxychains.conf 'socks5 127.0.0.1 1080' sudo

call_seperator
echo -e "${Red}Step 4${NC}: setup command alias"
update_file $HOME/.bashrc 'alias sscmd="source $HOME/cmd/sscmd.sh"'
update_file $HOME/.bashrc 'alias uscmd="source $HOME/cmd/uscmd.sh"'

call_seperator
echo -e "${Red}Step 4:${NC}: please config your ssserver in ss-qt5!"
echo -e "${Yellow} this step must be done by yourself manully"

source uscmd.sh
