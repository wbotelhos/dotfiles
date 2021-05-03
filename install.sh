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
  brew install git
  brew install gpg
  brew install imagemagick@6 && brew link imagemagick@6 --force # gem pristine rmagick
  brew install libxml2
  brew install nvm
  brew install packer
  brew install redis
  brew install tfenv
  brew install wget

  # need password

  brew update
  brew tap adoptopenjdk/openjdk
  brew upgrade
  brew install adoptopenjdk/openjdk/adoptopenjdk8
  brew cleanup
  brew cask cleanup

  # reload

  reload
}

divvy() {
  TO=~/Library/Preferences/com.mizage.Divvy.plist

  rm $TO

  ln -nfs ~/Dropbox/configs/data/com.mizage.Divvy.plist $TO
}

end() {
  echo -e "${GREEN}Done!${NO_COLOR}"
  echo -e "-------------------------------------\n"
}

reload() {
  source ~/.profile
}

rvm_install() {
  \curl -sSL https://get.rvm.io | bash
}

symlinks() {
  ln -nfs ~/Dropbox/configs/git-hooks ~/.git-hooks
  ln -nfs ~/Dropbox/configs/gnupg     ~/.gnupg
  ln -nfs ~/Dropbox/configs/ssh       ~/.ssh && chmod 600 ~/.ssh/*

  ln -nfs ~/Dropbox/configs/files/caprc     ~/.caprc
  ln -nfs ~/Dropbox/configs/files/job       ~/.job
  ln -nfs ~/Dropbox/configs/files/private   ~/.private
  ln -nfs ~/Dropbox/configs/files/ultrahook ~/.ultrahook
}

terminal() {
  [ `uname` != 'Linux' ] && open ./custom.terminal
}

###################
# --- install --- #
###################

begin

symlinks
divvy
brewer
rvm_install
reload
aws_cli
aws_session_manager
terminal

end
