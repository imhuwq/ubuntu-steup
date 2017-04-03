#!/bin/bash

source helper/vars.sh
source helper/utils.sh
source helper/sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install postgresql"
sudo apt update
sudo apt install python3-pip python-dev libpq-dev postgresql postgresql-contrib

call_seperator
echo -e "${Green}Done!${NC}"

source helper/uscmd.sh
