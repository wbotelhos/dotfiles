#!/bin/bash
GREEN='\033[0;32m'

ssh-keygen -t rsa -C 'wbotelhos@gmail.com'

echo -e "${GREEN}Copy the key with: pbcopy < ~/.ssh/id_rsa.pub"
