#!/bin/bash

source helper/vars.sh
source helper/utils.sh
source helper/sscmd.sh

tmuxConfTemplate='template/tmux.conf'
tmuxConf=$HOME/.tmux.conf

tmuxPlugins="$HOME/git/github/tmux-plugins"

tmuxPluginResurrectLocal="$tmuxPlugins/tmux-resurrect"
tmuxPluginResurrectRepo="https://github.com/tmux-plugins/tmux-resurrect.git"

tmuxPluginYankLocal="$tmuxPlugins/tmux-yank"
tmuxPluginYankRepo="https://github.com/tmux-plugins/tmux-yank.git"

function install_plugin {
    name="$1"
    local="$2"
    repo="$3"

    if [ ! -d "$local" ]; then
        echo -e "${Yellow}installing $name...${NC}"
        git clone $repo
    else
        echo -e "${Yellow}updating $name...${NC}"
        current=$PWD
        cd $local
        git pull
        cd $current
    fi
    run_shell="run-shell $local/$name.tmux"
    append_to_buttom $tmuxConf "$run_shell"

}

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
install_plugin resurrect $tmuxPluginResurrectLocal $tmuxPluginResurrectRepo
sudo apt install xclip
install_plugin yank $tmuxPluginYankLocal $tmuxPluginYankRepo

source helper/uscmd.sh

call_seperator
echo -e "${Green}Done!${NC}"
echo ""

