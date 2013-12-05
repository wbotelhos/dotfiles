#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

if [ `uname` == 'Linux' ]; then
  path="/home/$USER/Development/Sublime Text 2/sublime_text"
else
  path='/Applications/Sublime Text 2.app'
fi

if [ -e "$path" ]; then
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
