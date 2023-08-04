printf '%s\n' \
	almostMaximize \
	bottomCenterSixth \
	bottomHalf \
	bottomLeft \
	bottomLeftSixth \
	bottomRight \
	bottomRightSixth \
	center \
	centerHalf \
	centerThird \
	firstFourth \
	firstThird \
	firstThreeFourths \
	firstTwoThirds \
	larger \
	lastFourth \
	lastThird \
	lastThreeFourths \
	lastTwoThirds \
	leftHalf \
	maximize \
	maximizeHeight \
	moveDown \
	moveLeft \
	moveRight \
	moveUp \
	nextDisplay \
	previousDisplay \
	restore \
	rightHalf \
	secondFourth \
	smaller \
	thirdFourth \
	topCenterSixth \
	topHalf \
	topLeft \
	topLeftSixth \
	topRight \
	topRightSixth |
xargs -I{} \
defaults write com.knollsoft.Rectangle {} -dict

/usr/libexec/PlistBuddy -c "Delete previousDisplay" ~/Library/Preferences/com.knollsoft.Rectangle.plist 2> /dev/null
/usr/libexec/PlistBuddy -c "Add previousDisplay:keyCode integer 50" ~/Library/Preferences/com.knollsoft.Rectangle.plist
/usr/libexec/PlistBuddy -c "Add previousDisplay:modifierFlags integer 262144" ~/Library/Preferences/com.knollsoft.Rectangle.plist

defaults write com.knollsoft.Rectangle landscapeSnapAreas -string '[7,{"compound":-4},5,{"action":1},4,{"action":0}]'

defaults write com.knollsoft.Rectangle allowAnyShortcut -bool true
defaults write com.knollsoft.Rectangle hideMenubarIcon -bool true
