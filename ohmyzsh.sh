#!/bin/bash

source sscmd.sh
source vars.sh
source utils.sh

call_seperator
echo -e "${Red}Step 1${NC}: install zsh"
sudo apt install zsh

call_seperator
echo -e "${Red}Step 2${NC}: install oh-my-zsh"
sudo apt install wget
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

call_seperator
echo -e "${Red}Step 3${NC}: change default theme"
sed -i -E "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"af-magic\"/" $HOME/.zshrc

call_seperator
echo -e "${Green}Done!${NC}"
echo ""

source uscmd.sh
