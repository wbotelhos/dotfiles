#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

if [ `uname` == 'Linux' ]; then
  APP_PATH="/home/${USER}/Development/Sublime Text 2/sublime_text"
else
  APP_PATH='/Applications/Sublime Text 2.app'
fi

if [ -e "${APP_PATH}" ]; then
  cd sublime
  ./alias.sh
  ./keymap.sh
  ./settings.sh
  ./snippet.sh
  ./syntax.sh
  ./plugin.sh
else
  echo "The 'Sublime Text 2' is not installed yet. Do it first!"
fi

echo -e "${GREEN}Done!${NO_COLOR}\n"
