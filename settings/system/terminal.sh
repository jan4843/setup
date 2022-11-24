/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Basic:columnCount" ~/Library/Preferences/com.apple.Terminal.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Basic:columnCount integer 130" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Basic:rowCount" ~/Library/Preferences/com.apple.Terminal.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Basic:rowCount integer 40" ~/Library/Preferences/com.apple.Terminal.plist

/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Basic:ShowActiveProcessInTitle" ~/Library/Preferences/com.apple.Terminal.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Basic:ShowActiveProcessInTitle bool false" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Basic:ShowDimensionsInTitle" ~/Library/Preferences/com.apple.Terminal.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Basic:ShowDimensionsInTitle bool false" ~/Library/Preferences/com.apple.Terminal.plist

/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Basic:ShowRepresentedURLInTabTitle" ~/Library/Preferences/com.apple.Terminal.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Basic:ShowRepresentedURLInTabTitle bool false" ~/Library/Preferences/com.apple.Terminal.plist

/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Basic:shellExitAction" ~/Library/Preferences/com.apple.Terminal.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Basic:shellExitAction integer 1" ~/Library/Preferences/com.apple.Terminal.plist

/usr/libexec/PlistBuddy -c "Delete 'Window Settings':Basic:VisualBellOnlyWhenMuted" ~/Library/Preferences/com.apple.Terminal.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Basic:VisualBellOnlyWhenMuted bool false" ~/Library/Preferences/com.apple.Terminal.plist

defaults write com.apple.Terminal NSWindowTabbingShoudShowTabBarKey-TTWindow-TTWindowController-TTWindowController-VT-FS -bool true
