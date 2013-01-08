#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

cd "/Users/$USER/Library/Application Support/Sublime Text 2/Packages"

download() {
  echo -e "\n${GRAY}Installing $2 plugin...${NO_COLOR}"

  if [ -e "$2" ]; then
    echo -e "${GRAY}Backuping the $2 folder...${NO_COLOR}"
    mv $2 "$2_`date +%Y-%m-%d_%H-%M-%S`"
  fi

  git clone $1 $2
}

download 'https://github.com/wbond/sublime_alignment'                 'Alignment'
download 'https://github.com/colinta/SublimeChangeQuotes'             'ChangeQuotes'
download 'https://github.com/jnordberg/sublime-colorpick'             'ColorPicker'
download 'https://github.com/phillipkoebbe/DetectSyntax'              'DetectSyntax'
download 'https://github.com/eddorre/SublimeERB'                      'ERB'
download 'https://github.com/kek/sublime-expand-selection-to-quotes'  'ExpandQuotes'
download 'https://github.com/titoBouzout/SideBarEnhancements'         'SideBarEnhancements'
download 'https://github.com/zoomix/SublimeToggleSymbol'              'SublimeToggleSymbol'
download 'https://github.com/SublimeText/RSpec'                       'RSpec'

echo -e "\n${GREEN}Plugins installed!${NO_COLOR}\n"
