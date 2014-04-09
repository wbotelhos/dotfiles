#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

echo -e "${GRAY}Copying snippet files...${NO_COLOR}"

if [ `uname` == 'Linux' ]; then
  USER_PATH=${HOME}/.config/sublime-text-2/Packages/User

  mkdir -p $USER_PATH

  cp ./snippets/*.sublime-snippet ${HOME}/.config/sublime-text-2/Packages/User
else
  USER_PATH=${USER_PATH}

  mkdir -p $USER_PATH

  cp ./snippets/*.sublime-snippet ${USER_PATH}
fi

echo -e "${GREEN}snippet.sh done!${NO_COLOR}\n"
