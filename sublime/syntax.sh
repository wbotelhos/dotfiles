#!/bin/bash

GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

cucumber='https://gist.github.com/unixmonkey/864839/raw/8752ef038ecaab8c9f3174b6ec419ed6f391e0c3/Cucumber%20Plain%20Text%20Feature.tmLanguage'
markdown='https://gist.github.com/CrazyApi/2354062/raw/c0166961c0746d6942249b53ee1ccd493ad72b8c/markdown.xml'

echo -e "${GRAY}Copying syntax files...${NO_COLOR}"

if [ `uname` == 'Linux' ]; then
  USER_PATH=${HOME}/.config/sublime-text-2/Packages/User

  mkdir -p $USER_PATH

  wget $cucumber -O ${USER_PATH}/Cucumber.tmLanguage
  wget $markdown -O ${USER_PATH}/Markdown.tmLanguage
else
  USER_PATH=${HOME}/Library/'Application Support/Sublime Text 2'/Packages/User

  mkdir -p $USER_PATH

  wget $cucumber -O "${USER_PATH}/Cucumber.tmLanguage"
  wget $markdown -O "${USER_PATH}/Markdown.tmLanguage"
fi

echo -e "${GREEN}syntax.sh done!${NO_COLOR}\n"
