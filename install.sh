#!/bin/bash

##################
# --- Common --- #
##################

GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'
YELLOW='\033[1;33m'

##########################
# --- Configurations --- #
##########################

JOB_NAME='Dotfiles#install'

#####################
# --- Functions --- #
#####################

begin() {
  echo -e "-------------------------------------"
  echo -e "${GRAY}Starting ${JOB_NAME}...${NO_COLOR}\n"
}

config() {
  mkdir -p ~/.ssh
  cp files/config ~/.ssh/config
}

dotfiles() {
  for file in `ls files`; do
    cp files/${file} ~/.${file}
  done
}

end() {
  echo -e "${GREEN}Done!${NO_COLOR}"
  echo -e "-------------------------------------\n"
}

linking() {
  if [ `uname` == 'Linux' ]; then
    ENTRY='source ~/.bash_profile'
    FILE=~/.bashrc
    RESULT=$(grep "${ENTRY}" $FILE)

    [ "$RESULT" == '' ] && echo $ENTRY >> $FILE
  fi
}

reload() {
  . ~/.bash_profile
}

terminal() {
  [ `uname` != 'Linux' ] && open ./more/wbotelhos.terminal
}

###################
# --- Install --- #
###################

begin

dotfiles
config
terminal
linking
reload

end
