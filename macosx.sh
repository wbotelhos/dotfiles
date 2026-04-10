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

echo 'Disable window animations'
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

echo 'Disable scroll animations'
defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false

echo 'Disable Quick Look panel animation'
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0

echo 'Disable scroll view rubberbanding'
defaults write NSGlobalDomain NSScrollViewRubberbanding -bool false

echo 'Disable document revisions window animation'
defaults write NSGlobalDomain NSDocumentRevisionsWindowTransformAnimation -bool false

echo 'Disable toolbar full screen animation'
defaults write NSGlobalDomain NSToolbarFullScreenAnimationDuration -float 0

echo 'Disable browser column animation'
defaults write NSGlobalDomain NSBrowserColumnAnimationSpeedMultiplier -float 0

echo 'Enable reduce motion in Accessibility'
defaults write com.apple.Accessibility ReduceMotionEnabled -bool true

echo 'Disable Dock autohide animation'
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

echo 'Disable Springboard animations'
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0

echo 'Disable Dock launch animation'
defaults write com.apple.dock launchanim -bool false

echo 'Set Dock minimize effect to scale'
defaults write com.apple.dock mineffect -string "scale"

echo 'Disable Finder animations'
defaults write com.apple.finder DisableAllAnimations -bool true

echo 'Avoid creating .DS_Store files on network volumes'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo 'Disable the warning when changing a file extension'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo 'Require password immediately after sleep or screen saver begins'
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo 'Disable the Ping sidebar in iTunes'
defaults write com.apple.iTunes disablePingSidebar -bool true

echo 'Disable all the other Ping stuff in iTunes'
defaults write com.apple.iTunes disablePing -bool true

echo 'Make ⌘ + F focus the search input in iTunes'
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add 'Target Search Field' '@F'

echo 'Enables keyboard auto repeat'
defaults write -g ApplePressAndHoldEnabled -bool false

echo 'Showing the Users directory'
sudo chflags nohidden /Users

echo 'Speed up window resize animation'
sudo defaults write -g NSWindowResizeTime -float 0.003

echo 'Fix Blurry Fonts on Mojave'
defaults -currentHost write -globalDomain AppleFontSmoothing -int 3
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

echo 'Disable Popup Showing Accented Characters When Holding Down a Key'
defaults write -g ApplePressAndHoldEnabled -bool false

echo 'Kill affected applications'
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

echo 'Hide Desktop Icons'
defaults write com.apple.finder CreateDesktop -bool false

echo 'Kill Finder'
killall Finder

echo -e "\n${GREEN}Done!${NO_COLOR}\n"
