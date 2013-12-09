#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

echo -e "\n${GRAY}Copying user profile file...${NO_COLOR}"

if [ `uname` == 'Linux' ]; then
  cp ./settings/Preferences.sublime-settings ${HOME}/.config/sublime-text-2/Packages/User
else
  cp ./settings/Preferences.sublime-settings ${HOME}/Library/'Application Support/Sublime Text 2'/Packages/User
fi

echo -e "${GREEN}profile.sh done!${NO_COLOR}\n"
