#!/bin/bash

source helper/vars.sh
source helper/utils.sh
source helper/sscmd.sh


call_seperator
sudo_alias_begin='# set sudo alias to sudo -E'
sudo_alias_cmd='alias sudo="sudo -E"'

echo -e "${Red}Step 1${NC}: $sudo_alias_begin"
grep -q "$sudo_alias_begin" $HOME/.bashrc || echo -e "\n$sudo_alias_begin\n$sudo_alias_cmd\n" >> $HOME/.bashrc

if [ -f $HOME/.zshrc ]; then
    grep -q "$sudo_alias_begin" $HOME/.zshrc || echo -e "\n$sudo_alias_begin\n$sudo_alias_cmd\n" >> $HOME/.zshrc
fi

source helper/uscmd.sh
