#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

library=/Users/$USER/Library

echo -e "${GRAY}Copying keymaps files...${NO_COLOR}"
cp ./keymaps/*.sublime-keymap $library/'Application Support/Sublime Text 2/Packages/User'

echo -e "${GREEN}keymap.sh done!${NO_COLOR}\n"
