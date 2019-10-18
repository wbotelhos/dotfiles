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

brewer() {
  brew install chromedriver
  brew install git
  brew install gpg
  brew install imagemagick@6 && brew link imagemagick@6 --force # gem pristine rmagick
  brew install libxml2
  brew install nvm
  brew install packer
  brew install redis
  brew install terraform
  brew install wget

  # need password

  brew cask install caskroom/cask/java

  # MySQL

  brew install cmake
  brew install mysql@5.6

  # Node

  nvm install node 9
  npm install -g npm@latest

  # reload

  reload
}

bundle_config() {
  mkdir -p ~/.bundle

  cp more/bundle/config ~/.bundle/config
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

gem() {
  ln -nfs ~/Dropbox/gem ~/.gem
}

linking() {
  ENTRY='source ~/.profile'

  if [ `uname` == 'Linux' ]; then
    FILE=~/.bashrc
  else
    FILE=~/.bash_profile
  fi

  RESULT=$(grep "${ENTRY}" $FILE)

  [ "$RESULT" == '' ] && echo $ENTRY >> $FILE
}

reload() {
  . ~/.profile
}

symlinks() {
  ln -nfs ~/Dropbox/atom             ~/.atom
  ln -nfs ~/Dropbox/aws              ~/.aws
  ln -nfs ~/Dropbox/chef             ~/.chef
  ln -nfs ~/Dropbox/dotfiles/job     ~/.job
  ln -nfs ~/Dropbox/dotfiles/private ~/.private
  ln -nfs ~/Dropbox/ssh              ~/.ssh
}

templates() {
  cp -R more/git-hooks ~/.git-hooks
}

terminal() {
  [ `uname` != 'Linux' ] && open ./more/custom.terminal
}

###################
# --- install --- #
###################

begin

dotfiles
bundle_config
symlinks
templates
linking
reload
brewer
gem
terminal

end
