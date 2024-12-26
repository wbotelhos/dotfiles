#!/bin/bash

##################
# --- common --- #
##################

GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

###################
# --- configs --- #
###################

JOB_NAME='Dotfiles#install'

#####################
# --- functions --- #
#####################

begin() {
  echo -e "-------------------------------------"
  echo -e "${GRAY}Starting ${JOB_NAME}...${NO_COLOR}\n"
}

end() {
  echo -e "${GREEN}Done!${NO_COLOR}"
  echo -e "-------------------------------------\n"
}

reload() {
  source ~/.bash_profile
}

rvm_install() {
  \curl -sSL https://get.rvm.io | bash
}

symlinks() {
  ln -nfs ~/Dropbox/configs/gnupg ~/.gnupg
  ln -nfs ~/Dropbox/configs/ssh ~/.ssh && chmod 700 ~/.ssh/*

  ln -nfs ~/Dropbox/Mackup/.mackup-ignore ~/.mackup-ignore
}

###################
# --- install --- #
###################

begin

symlinks
rvm_install
reload

end
