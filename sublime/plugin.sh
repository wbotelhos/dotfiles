#!/bin/bash
GRAY='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[1;0m'

force=$1

if [ `uname` == 'Linux' ]; then
  cd ${HOME}/.config/sublime-text-2/Packages
else
  cd "${HOME}/Library/Application Support/Sublime Text 2/Packages"
fi

download() {
  if [ -e "$2" ]; then
    if [ "$force" == 'force' ]; then
      log_backup_and_install $2

      mv $2 "$2_`date +%Y-%m-%d_%H-%M-%S`"
      git clone $1 $2
    fi
  else
    log_install $2

    git clone $1 $2
  fi
}

log_install() {
  echo -e "\n${GRAY}Installing $1 plugin...${NO_COLOR}"
}

log_backup_and_install() {
  echo -e "\n${GRAY}Backuping $1 folder and install a new one...${NO_COLOR}"
}

download 'https://github.com/adampresley/sublime-js-minify'          'JsMinify'
download 'https://github.com/colinta/SublimeChangeQuotes'            'ChangeQuotes'
download 'https://github.com/eddorre/SublimeERB'                     'ERB'
download 'https://github.com/facelessuser/ApplySyntax'               'ApplySyntax'
download 'https://github.com/gja/sublime-text-2-jasmine'             'Jasmine'
download 'https://github.com/jnordberg/sublime-colorpick'            'ColorPicker'
download 'https://github.com/kek/sublime-expand-selection-to-quotes' 'ExpandQuotes'
download 'https://github.com/kemayo/sublime-text-2-git'              'Git'
download 'https://github.com/Kronuz/SublimeCodeIntel'                'CodeIntel'
download 'https://github.com/nathos/sass-textmate-bundle'            'SASSBundler'
download 'https://github.com/revolunet/sublimetext-markdown-preview' 'MarkdownPreview'
download 'https://github.com/sergeche/emmet-sublime'                 'Emmet'
download 'https://github.com/SublimeText/RSpec'                      'RSpec'
download 'https://github.com/titoBouzout/SideBarEnhancements'        'SideBarEnhancements'
download 'https://github.com/victorporof/Sublime-JSHint'             'SublimeJSHint'
download 'https://github.com/wbond/sublime_alignment'                'Alignment'
download 'https://github.com/wbotelhos/sublime-assignment'           'Assignment'
download 'https://github.com/zoomix/SublimeToggleSymbol'             'ToggleSymbol'

echo -e "\n${GREEN}plugin.sh done!${NO_COLOR}\n"
