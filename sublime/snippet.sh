#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

echo -e "${GRAY}Copying snippet files...${NO_COLOR}"

if [ `uname` == 'Linux' ]; then
  cp ./snippets/*.sublime-snippet /home/$USER/.config/sublime-text-2/Packages/User
else
  cp ./snippets/*.sublime-snippet /Users/$USER/Library/'Application Support/Sublime Text 2'/Packages/User
fi

echo -e "${GREEN}snippet.sh done!${NO_COLOR}\n"
