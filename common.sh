BASH_PROFILE_PATH=${HOME}/.bash_profile
BASHRC_PATH=${HOME}/.bashrc
DOTFILES_PATH=${HOME}/workspace/dotfiles
JOB_NAME='Job#missing'

source ${DOTFILES_PATH}/colors.sh

begin() {
  echo -e "-------------------------------------"
  echo -e "${GRAY}Starting ${JOB_NAME}...${NO_COLOR}\n"
}

end() {
  echo -e "${GREEN}Done!${NO_COLOR}"
  echo -e "-------------------------------------\n"
}

