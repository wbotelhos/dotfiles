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

atom() {
  cp -rp ./atom ~/.atom

  apm install aligner-javascript
  apm install aligner-ruby
  apm install atom-handlebars
  apm install atom-wrap-in-tag
  apm install block-travel
  apm install clean-context-menu
  apm install erb-snippets
  apm install highlight-selected
  apm install language-csv
  apm install language-graphql
  apm install language-rspec
  apm install language-terraform
  apm install language-varnish
  apm install linter-eslint
  apm install linter-js-yaml
  apm install linter-json-lint
  apm install linter-rubocop
  apm install linter-sass-lint
  apm install linter-terraform-syntax
  apm install linter-ui-default
  apm install pretty-json
  apm install rubocop-auto-correct
  apm install sort-lines
  apm install yaml-sortkey
}

begin() {
  echo -e "-------------------------------------"
  echo -e "${GRAY}Starting ${JOB_NAME}...${NO_COLOR}\n"
}

brewer() {
  brew install redis
}

config() {
  mkdir -p ~/.bundle
  mkdir -p ~/.ssh

  cp more/bundle/config ~/.bundle/config
  cp more/ssh/config    ~/.ssh/config
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

job() {
  cp more/job ~/.job
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

templates() {
  cp -R more/git-hooks ~/.git-hooks
}

terminal() {
  [ `uname` != 'Linux' ] && open ./more/wbotelhos.terminal
}

###################
# --- install --- #
###################

begin

dotfiles
config
templates
terminal
linking
job
reload
atom

end
