defaults delete com.apple.dock tilesize 2> /dev/null
defaults write com.apple.dock size-immutable -bool true

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

defaults write com.apple.dock persistent-apps -array ''
