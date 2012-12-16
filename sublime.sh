#!/bin/bash
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'
GRAY='\033[0;36m'
RED='\033[1;31m'

ALIAS='sublime'
ALIAS_PATH=/usr/local/bin/$ALIAS
LIBRARY_PATH=/Users/$USER/Library

SUBLIME_APP=$(ls /Applications/Sublime\ Text\ 2.app 2> /dev/null)

if [ $SUBLIME_APP ]; then
  echo -e "\n${GRAY}Generating the alias '${ALIAS}' open command...${NO_COLOR}"

  if [ -f $ALIAS_PATH ]; then
    echo -e "${RED}The alias '${ALIAS}' already exists! [skipped]${NO_COLOR}"
  else
    sudo ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl $ALIAS_PATH
  fi

  echo -e "\n${GRAY}Copying user profile file...${NO_COLOR}"
  cp ./sublime/Preferences.sublime-settings $LIBRARY_PATH/Application\ Support/Sublime\ Text\ 2/Packages/User

  echo -e "\n${GRAY}Copying snippet files...${NO_COLOR}"
  cp ./sublime/*.sublime-snippet $LIBRARY_PATH/Application\ Support/Sublime\ Text\ 2/Packages/User
else
  echo "The 'Sublime Text 2.app' is not installed yet. Do it first!"
fi

echo -e "\n${GREEN}Done!${NO_COLOR}\n"
