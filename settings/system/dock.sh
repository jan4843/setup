defaults delete com.apple.dock tilesize 2> /dev/null
defaults write com.apple.dock size-immutable -bool true

defaults write com.apple.dock mineffect -string scale

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

defaults write com.apple.dock show-recent-count -int 1

defaults write com.apple.dock persistent-apps -array
for app_dir in /Applications/Mimestream.app; do
    [ -e "$app_dir" ] || continue
    defaults write com.apple.dock persistent-apps -array-add "
    <dict>
    <key>tile-data</key>
    <dict>
        <key>file-data</key>
        <dict>
        <key>_CFURLString</key>
        <string>$app_dir</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
        </dict>
    </dict>
    </dict>
    "
done
