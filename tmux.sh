#!/bin/bash


source vars.sh
source utils.sh
source sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install tmus"
sudo apt install tmux

call_seperator
echo -e "${Red}Step 2${NC}: config tmux"

tmuxConf=$HOME/.tmux.conf
if [ -f $tmuxConf ]; then
    echo -e "${Yellow}backing up current tmux config file...${NC}"
    cp $tmuxConf $tmuxConf.bk
else
    cp $tmuxConfTemplate $tmuxConf
fi

source uscmd.sh

call_seperator
echo -e "${Green}Done!${NC}"
echo ""

