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

end() {
  echo -e "${GREEN}Done!${NO_COLOR}"
  echo -e "-------------------------------------\n"
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
  source ~/.profile
}

symlinks() {
  ln -nfs ~/Dropbox/configs/atom      ~/.atom
  ln -nfs ~/Dropbox/configs/aws       ~/.aws
  ln -nfs ~/Dropbox/configs/bundle    ~/.bundle
  ln -nfs ~/Dropbox/configs/chef      ~/.chef
  ln -nfs ~/Dropbox/configs/gem       ~/.gem
  ln -nfs ~/Dropbox/configs/git-hooks ~/.git-hooks
  ln -nfs ~/Dropbox/configs/gnupg     ~/.gnupg
  ln -nfs ~/Dropbox/configs/ssh       ~/.ssh

  ln -nfs ~/Dropbox/configs/files/aprc      ~/.aprc
  ln -nfs ~/Dropbox/configs/files/caprc     ~/.caprc
  ln -nfs ~/Dropbox/configs/files/gemrc     ~/.gemrc
  ln -nfs ~/Dropbox/configs/files/gitconfig ~/.gitconfig
  ln -nfs ~/Dropbox/configs/files/hgrc      ~/.hgrc
  ln -nfs ~/Dropbox/configs/files/irbrc     ~/.irbrc
  ln -nfs ~/Dropbox/configs/files/job       ~/.job
  ln -nfs ~/Dropbox/configs/files/jshintrc  ~/.jshintrc
  ln -nfs ~/Dropbox/configs/files/private   ~/.private
  ln -nfs ~/Dropbox/configs/files/profile   ~/.profile
  ln -nfs ~/Dropbox/configs/files/pryrc     ~/.pryrc
  ln -nfs ~/Dropbox/configs/files/rspec     ~/.rspec
  ln -nfs ~/Dropbox/configs/files/rvmrc     ~/.rvmrc
}

terminal() {
  [ `uname` != 'Linux' ] && open ./more/custom.terminal
}

###################
# --- install --- #
###################

begin

symlinks
linking
reload
brewer
terminal

end
