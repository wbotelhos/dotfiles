#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

library=/Users/$USER/Library

echo -e "\n${GRAY}Copying user profile file...${NO_COLOR}"
cp ./settings/Preferences.sublime-settings $library/'Application Support/Sublime Text 2/Packages/User'

echo -e "${GREEN}profile.sh done!${NO_COLOR}\n"
