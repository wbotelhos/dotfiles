#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

library=/Users/$USER/Library
url='http://sublime.wbond.net/Package%20Control.sublime-package'

echo -e "\n${GRAY}Installing Package Control...${NO_COLOR}"
cd $library/'Application Support/Sublime Text 2/Installed Packages'
wget $url

echo -e "${GRAY}Open Package Control: cmd + shift + p and type install${NO_COLOR}"
echo -e "${GREEN}package_control done!${NO_COLOR}\n"
