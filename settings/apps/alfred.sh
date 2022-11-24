sync_folder="$HOME/Library/Dropbox/Alfred"

mkdir -p ~/Library/Application\ Support/Alfred
cp "$sync_folder"/powerpack.*.dat ~/Library/Application\ Support/Alfred

defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string "$sync_folder"
cat > ~/Library/Application\ Support/Alfred/prefs.json <<EOF
{
	"current" : "${sync_folder//\//\\/}\/Alfred.alfredpreferences",
	"syncfolders" : {
		"5" : "${sync_folder//\//\\/}"
	}
}
EOF

if ! lsappinfo info -only bundleID com.runningwithcrayons.Alfred | grep -q .; then
	defaults write com.runningwithcrayons.Alfred-Preferences lastTab -string appearance
	open -a '/Applications/Alfred 5.app/Contents/Preferences/Alfred Preferences.app'
	while ! lsappinfo find bundleID=com.runningwithcrayons.Alfred-Preferences | grep -q .; do
		sleep 1
	done
	osascript -e 'tell application id "com.runningwithcrayons.Alfred-Preferences" to quit'
fi
for pref_dir in "$sync_folder"/Alfred.alfredpreferences/preferences/local/*/; do
	mkdir -p "$pref_dir/hotkey"
	/usr/libexec/PlistBuddy -c "Delete default" "$pref_dir/hotkey/prefs.plist" > /dev/null 2>&1
	/usr/libexec/PlistBuddy -c "Add default:key integer 49" "$pref_dir/hotkey/prefs.plist"
	/usr/libexec/PlistBuddy -c "Add default:mod integer 1048576" "$pref_dir/hotkey/prefs.plist"
	/usr/libexec/PlistBuddy -c "Add default:string string ' '" "$pref_dir/hotkey/prefs.plist"

	mkdir -p "$pref_dir/features/clipboard"
	defaults write "$pref_dir/features/clipboard/prefs.plist" enabled -bool true
done
