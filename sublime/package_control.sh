#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

url='http://sublime.wbond.net/Package%20Control.sublime-package'

echo -e "\n${GRAY}Installing Package Control...${NO_COLOR}"

if [ `uname` == 'Linux' ]; then
  cd "/home/$USER/.config/sublime-text-2"
else
  cd "/Users/$USER/Library/Application Support/Sublime Text 2"
fi

cd "Installed Packages"

wget $url

echo -e "${GRAY}Open Package Control: cmd|Ctrl + shift + p and type install${NO_COLOR}"
echo -e "${GREEN}package_control.sh done!${NO_COLOR}\n"
