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

aws_cli() {
  curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
  unzip awscli-bundle.zip
  sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
}

aws_session_manager() {
  curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
  unzip sessionmanager-bundle.zip
  sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin
}

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

  brew cask install java

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

linux() {
  if [ `uname` == 'Linux' ]; then
    ENTRY='source ~/.profile'

    FILE=~/.bashrc

    RESULT=$(grep "${ENTRY}" $FILE)

    [ "$RESULT" == '' ] && echo $ENTRY >> $FILE
  fi
}

reload() {
  source ~/.profile
}

rvm_install() {
  \curl -sSL https://get.rvm.io | bash
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
linux
brewer
rvm_install
reload
aws_cli
aws_session_manager
terminal

end
