#! /bin/bash
GREEN="\033[0;32m"
NO_COLOR="\033[1;0m"
GRAY="\033[0;36m"

echo -e "\n${GREEN}Initializing...${NO_COLOR}\n"

cp files/bash_profile ~/.bash_profile
cp files/caprc ~/.caprc
cp files/gemrc ~/.gemrc
cp files/gitconfig ~/.gitconfig
cp files/gitignore ~/.gitignore
cp files/hgrc ~/.hgrc
cp files/irbrc ~/.irbrc
cp files/pryrc ~/.pryrc
#cp files/rspec ~/.rspec

./macosx.sh

source ~/.bash_profile

echo -e "${GRAY}\n* Copy the rspec file as .rspec to your projects!"
echo -e "* Copy the gitignore file as .gitignore to your projects!"
echo -e "\n${GREEN}Done!${NO_COLOR}\n"

open files/Professional.terminal
