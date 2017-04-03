#!/bin/bash

source vars.sh
source utils.sh
source sscmd.sh

call_seperator
echo -e "${Red}Step 1${NC}: install postgresql"
sudo apt update
sudo apt install python3-pip python-dev libpq-dev postgresql postgresql-contrib

call_seperator
echo -e "${Green}Done!${NC}"

source uscmd.sh
