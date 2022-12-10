{
	strings /Applications/Rectangle.app/Contents/Resources/Assets.car |
	grep 'Template\.png$' |
	sed 's/Template\.png$//' |
	grep -v '^make'

	printf '%s\n' smaller larger
} |
xargs -I{} \
defaults write com.knollsoft.Rectangle {} -dict

/usr/libexec/PlistBuddy -c "Delete previousDisplay" ~/Library/Preferences/com.knollsoft.Rectangle.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add previousDisplay:keyCode integer 50" ~/Library/Preferences/com.knollsoft.Rectangle.plist
/usr/libexec/PlistBuddy -c "Add previousDisplay:modifierFlags integer 262144" ~/Library/Preferences/com.knollsoft.Rectangle.plist

defaults write com.knollsoft.Rectangle landscapeSnapAreas -string '[7,{"compound":-4},5,{"action":1},4,{"action":0}]'

defaults write com.knollsoft.Rectangle allowAnyShortcut -bool true
defaults write com.knollsoft.Rectangle hideMenubarIcon -bool true
