#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'
RED='\033[1;31m'

echo -e "\n${GRAY}Copying config files...${NO_COLOR}\n"

echo '.bash_profile'
cp files/bash_profile ~/.bash_profile

echo '.caprc'
cp files/caprc ~/.caprc

echo '.gemrc'
cp files/gemrc ~/.gemrc

echo '.gitconfig'
cp files/gitconfig ~/.gitconfig

echo '.hgrc'
cp files/hgrc ~/.hgrc

echo '.irbrc'
cp files/irbrc ~/.irbrc

echo '.pryrc'
cp files/pryrc ~/.pryrc

echo '.rspec'
cp files/rspec ~/.rspec

echo -e "\n${GRAY}Refreshing the .bash_profile${NO_COLOR}"
source ~/.bash_profile

echo -e "${GRAY}Applying Terminal config...${NO_COLOR}"
open more/Professional.terminal

echo -e "\n${GRAY}* Copy the gitignore file as .gitignore to your projects!"
echo -e "\n${GREEN}Done!${NO_COLOR}\n"
