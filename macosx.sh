#!/bin/bash

GREEN='\033[0;32m'

echo -e '\nShow path in window title'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

echo 'Show Path bar in Finder'
defaults write com.apple.finder ShowPathbar -bool true

echo 'Use current directory as default search scope in Finder'
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'

echo 'Expand print panel by default'
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE

echo 'Expand save panel by default'
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo 'Disable the "Are you sure you want to open this application?" dialog'
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo 'Don’t animate opening applications from the Dock'
defaults write com.apple.dock launchanim -bool false

echo 'Disable opening and closing window animations'
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

echo 'Avoid creating .DS_Store files on network volumes'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo 'Disable the warning when changing a file extension'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo 'Require password immediately after sleep or screen saver begins'
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo 'Remove useless icons from Safari’s bookmarks bar'
defaults write com.apple.Safari ProxiesInBookmarksBar '()'

echo 'Disable the Ping sidebar in iTunes'
defaults write com.apple.iTunes disablePingSidebar -bool true

echo 'Disable all the other Ping stuff in iTunes'
defaults write com.apple.iTunes disablePing -bool true

echo 'Make ⌘ + F focus the search input in iTunes'
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add 'Target Search Field' '@F'

echo 'Disable send and reply animations in Mail.app'
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true

echo 'Enables keyboard auto repeat'
defaults write -g ApplePressAndHoldEnabled -bool false

echo 'Workaround for Accessibility Issues on Mac OS X Mavericks'
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db 'delete from access where client like "%divvy%"'

echo 'Showing the Users directory (temporary)'
sudo chflags nohidden /Users

echo 'Disabling Notification Center'
sudo defaults write /System/Library/LaunchAgents/com.apple.notificationcenterui KeepAlive -bool False

echo 'Speed up window resize animation'
sudo defaults write -g NSWindowResizeTime -float 0.003

echo 'Kill affected applications'
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

echo 'Kill Finder'
killall Finder

echo -e "\n${GREEN}Done!${NO_COLOR}\n"
