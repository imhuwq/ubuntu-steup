#!/bin/bash

source $HOME/cmd/helper/sscmd.sh

sudo apt remove -y docker docker-engine docker.io
sudo apt  update
sudo apt install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install -y docker-ce
sudo systemctl enable docker.service
sudo usermod -aG docker ${USER}
docker --version
