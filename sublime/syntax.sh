#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

cucumber='https://gist.github.com/unixmonkey/864839/raw/8752ef038ecaab8c9f3174b6ec419ed6f391e0c3/Cucumber%20Plain%20Text%20Feature.tmLanguage'

echo -e "${GRAY}Copying syntax files...${NO_COLOR}"

if [ `uname` == 'Linux' ]; then
  wget $cucumber > /home/$USER/.config/sublime-text-2/Packages/User/Cucumber.tmLanguage
else
  wget $cucumber > /Users/$USER/Library/'Application Support/Sublime Text 2'/Packages/User/Cucumber.tmLanguage
fi

echo -e "${GREEN}syntax.sh done!${NO_COLOR}\n"
