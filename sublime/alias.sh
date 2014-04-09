#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'
RED='\033[1;31m'

ALIAS_NAME='sublime'
ALIAS_PATH=/usr/local/bin/${ALIAS_NAME}

echo -e "\n${GRAY}Generating the alias '${ALIAS_NAME}' open command...${NO_COLOR}"

if [ -L "$ALIAS_PATH" ]; then
  sudo unlink $ALIAS_PATH
fi

if [ `uname` == 'Linux' ]; then
  sudo ln -s "/home/${USER}/Development/Sublime Text 2/sublime_text" $ALIAS_PATH
else
  sudo ln -s '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl' $ALIAS_PATH
fi

echo -e "${GREEN}alias.sh done!${NO_COLOR}\n"
