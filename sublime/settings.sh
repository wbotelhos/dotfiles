#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

echo -e "\n${GRAY}Copying user profile file...${NO_COLOR}"

if [ `uname` == 'Linux' ]; then
  USER_PATH=${HOME}/.config/sublime-text-2/Packages/User

  mkdir -p $USER_PATH

  cp ./settings/Preferences.sublime-settings ${USER_PATH}
else
  USER_PATH=${HOME}/Library/'Application Support/Sublime Text 2'/Packages/User

  mkdir -p $USER_PATH

  cp ./settings/Preferences.sublime-settings "$USER_PATH"
fi

echo -e "${GREEN}profile.sh done!${NO_COLOR}\n"
