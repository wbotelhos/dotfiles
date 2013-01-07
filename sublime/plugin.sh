#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

library=/Users/$USER/Library

cd $library/'Application Support/Sublime Text 2/Packages'

echo -e "${GRAY}Copying Alignment...${NO_COLOR}"
mv Alignment "Alignment_`date +%Y-%m-%d_%H-%M-%S`"
git clone https://github.com/wbond/sublime_alignment Alignment

echo -e "${GREEN}Plugins copied!${NO_COLOR}\n"
