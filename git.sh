#!/bin/bash
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

ssh-keygen -t rsa -C 'wbotelhos@gmail.com'

echo -e "${GREEN}Copy the key with: pbcopy < ~/.ssh/id_rsa.pub${NO_COLOR}"

echo -e "${GREEN}Applying git configs${NO_COLOR}"

git config --global --bool pull.rebase true
