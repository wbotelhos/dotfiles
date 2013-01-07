#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

sublime_path='/Applications/Sublime Text 2.app'

if [ -e "$sublime_path" ]; then
  cd sublime
  ./alias.sh
  ./profile.sh
  ./snippet.sh
  ./keymap.sh
  ./plugin.sh
else
  echo "The 'Sublime Text 2.app' is not installed yet. Do it first!"
fi

echo -e "${GREEN}Done!${NO_COLOR}\n"
