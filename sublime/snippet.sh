#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

library=/Users/$USER/Library

echo -e "${GRAY}Copying snippet files...${NO_COLOR}"
cp ./sublime/snippets/*.sublime-snippet $library/'Application Support/Sublime Text 2/Packages/User'

echo -e "${GREEN}Snippets copied!${NO_COLOR}\n"
