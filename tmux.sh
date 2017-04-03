#!/bin/bash

source helper/vars.sh
source helper/utils.sh
source helper/sscmd.sh

tmuxConfTemplate='template/tmux.conf'
tmuxConf=$HOME/.tmux.conf

tmuxPlugins="$HOME/git/github/tmux-plugins"

tmuxPluginResurrectLocal="$tmuxPlugins/tmux-resurrect"
tmuxPluginResurrectRepo="https://github.com/tmux-plugins/tmux-resurrect.git"

call_seperator
echo -e "${Red}Step 1${NC}: install tmus"
sudo apt install tmux

call_seperator
echo -e "${Red}Step 2${NC}: config tmux"

if [ -f $tmuxConf ]; then
    echo -e "${Yellow}backing up current tmux config file...${NC}"
fi
echo -e "${Yellow}generating new tmux config file...${NC}"
cp $tmuxConfTemplate $tmuxConf

call_seperator
echo -e "${Red}Step 3${NC}: install plugins"

if [ ! -d $tmuxPluginResurrectLocal ]; then
    echo -e "${Yellow}installing tmux-resurrect...${NC}"
    git clone $tmuxPluginResurrectRepo
else
    echo -e "${Yellow}updating tmux-resurrect...${NC}"
    current=$PWD
    cd $tmuxPluginResurrectLocal
    git pull
    cd $current
fi
append_to_buttom $tmuxConf "run-shell $tmuxPluginResurrectLocal/resurrect.tmux"

source helper/uscmd.sh

call_seperator
echo -e "${Green}Done!${NC}"
echo ""

