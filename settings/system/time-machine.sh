defaults read /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup 2> /dev/null | grep -q '^1$' ||
sudo defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
