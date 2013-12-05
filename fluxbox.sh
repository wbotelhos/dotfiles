#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

LOCALE="${HOME}/.fluxbox"

echo -e "\n${GREEN}Updating the repository...${NO_COLOR}\n"
sudo apt-get update

echo -e "\n${GREEN}Installing XScreenSaver...${NO_COLOR}\n"
sudo apt-get install xscreensaver -y

echo -e "\n${GREEN}Installing Fluxbox...${NO_COLOR}\n"
sudo apt-get install fluxbox -y

rm -rf $LOCALE

echo -e "\n${GREEN}Copying Fluxbox files...${NO_COLOR}\n"
cp -r ./fluxbox $LOCALE

echo -e "\n${GREEN}Done!${NO_COLOR}\n"
