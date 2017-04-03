#!/bin/bash

source helper/vars.sh
source helper/utils.sh
source helper/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install building environments"

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils

call_seperator
echo -e "${Red}Step 2${NC}: install/update pyenv"

if [ -d $HOME/.pyenv ]; then
    echo -e "${Yellow}pyenv is already installed, updating...${NC}"
    current="$PWD"
    cd $HOME/.pyenv && git pull
    cd "$current"
else
    echo -e "${Yellow}pyenv is not installed, cloning...${NC}"
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

call_seperator
echo -e "${Red}Step 3${NC}: install/update pyenv-vrtualenv"
if [ -d $HOME/.pyenv/plugins/pyenv-virtualenv ]; then
    echo -e "${Yellow}pyenv-virtualenv is already installed, updating..."
    current="$PWD"
    cd $HOME/.pyenv/plugins/pyenv-virtualenv && git pull
    cd "$current"
else
    echo -e "${Yellow}pyenv-virtualenv is not installed, cloning..."
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

call_seperator
echo -e "${Red}Step 4${NC}: update bashrc file"
    echo -e "${Yellow}updating $HOME/.bashrc..."
    update_file "$HOME/.bashrc" 'export PYENV_ROOT="$HOME/.pyenv"'
    update_file "$HOME/.bashrc" 'export PATH="$PYENV_ROOT/bin:$PATH"'
    update_file "$HOME/.bashrc" 'eval "$(pyenv init -)"'
    update_file "$HOME/.bashrc" 'eval "$(pyenv virtualenv-init -)"'

    if [ -f $HOME/.zshrc ]; then
        echo -e "${Yellow}updating $HOME/.zshrc..."
        update_file "$HOME/.zshrc" 'export PYENV_ROOT="$HOME/.pyenv"'
        update_file "$HOME/.zshrc" 'export PATH="$PYENV_ROOT/bin:$PATH"'
        update_file "$HOME/.zshrc" 'eval "$(pyenv init -)"'
        update_file "$HOME/.zshrc" 'eval "$(pyenv virtualenv-init -)"'
        echo -e "${Yellow}enable pyenv in zsh"
        sed -i -E "s/plugins=\((.*?)(pyenv\s|\spyenv|pyenv)(.*?)\)/plugins=(\1\3)/" $HOME/.zshrc
        sed -i -E "s/plugins=\((.*?)\)/plugins=(\1 pyenv)/" $HOME/.zshrc
    fi

call_seperator
echo -e "${Red}Step 5${NC}: setup douban pypi mirror"
if [ ! -f $HOME/.pip/pip.conf ]; then
    mkdir -p $HOME/.pip
    touch $HOME/.pip/pip.conf
fi
update_file $HOME/.pip/pip.conf '[global]'
update_file $HOME/.pip/pip.conf 'index-url = https://pypi.douban.com/simple'

source helper/uscmd.sh

call_seperator
echo -e "${Green}Done!${NC}"
echo ""
