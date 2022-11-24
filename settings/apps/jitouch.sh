defaults write com.jitouch.Jitouch ShowIcon -int 0

defaults write com.jitouch.Jitouch Sensitivity -float 4.0

defaults write com.jitouch.Jitouch enAll -int 1
defaults write com.jitouch.Jitouch enMMAll -int 1
defaults write com.jitouch.Jitouch enTPAll -int 0

defaults write com.jitouch.Jitouch MagicMouseCommands -array '<dict>
	<key>Application</key>
	<string>All Applications</string>
	<key>Gestures</key>
	<array>
		<dict>
			<key>Command</key>
			<string>Middle Click</string>
			<key>Enable</key>
			<string>1</string>
			<key>Gesture</key>
			<string>Middle Click</string>
			<key>IsAction</key>
			<string>1</string>
			<key>KeyCode</key>
			<string>0</string>
			<key>ModifierFlags</key>
			<string>0</string>
		</dict>
	</array>
	<key>Path</key>
	<string></string>
</dict>'

defaults write com.jitouch.Jitouch License -string $'free_license\n8718498470dee7ab7eb5b8edbac59edc1fdb6966'
