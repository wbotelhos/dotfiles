#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'
RED='\033[1;31m'

aliaz='sublime'
alias_path=/usr/local/bin/${aliaz}

echo -e "\n${GRAY}Generating the alias '${aliaz}' open command...${NO_COLOR}"

if [ -L "$alias_path" ]; then
  echo -e "${RED}The alias '${aliaz}' already exists! [skipped]${NO_COLOR}"
else
  if [ `uname` == 'Linux' ]; then
    sudo ln -s '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl' $alias_path
  else
    sudo ln -s "/home/${USER}/Development/Sublime Text 2/sublime_text" $alias_path
  fi
fi

echo -e "${GREEN}alias.sh done!${NO_COLOR}"
