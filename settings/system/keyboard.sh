defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

defaults write -g AppleKeyboardUIMode -int 2

/usr/libexec/PlistBuddy -c "Delete AppleSymbolicHotKeys:64" ~/Library/Preferences/com.apple.symbolichotkeys.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add AppleSymbolicHotKeys:64:enabled bool false" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add AppleSymbolicHotKeys:64:value:type string standard" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add AppleSymbolicHotKeys:64:value:parameters:0 integer 32" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add AppleSymbolicHotKeys:64:value:parameters:1 integer 49" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Add AppleSymbolicHotKeys:64:value:parameters:2 integer 1048576" ~/Library/Preferences/com.apple.symbolichotkeys.plist

defaults write -g ApplePressAndHoldEnabled -bool false
