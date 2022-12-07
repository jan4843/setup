# Setup

## Installation

- Transfer authentication tokens
	- Copy SSH keys
	```
	mkdir -p ~/.ssh
	chmod go= ~/.ssh
	open ~/.ssh
	```
	```
	chmod go= ~/.ssh/id_*
	chmod go+r ~/.ssh/id_*.pub
	```
	- Copy rclone and restic config
	```
	mkdir -p ~/.config/rclone ~/.config/restic
	open ~/.config/rclone ~/.config/restic
	```
- Install dependencies
	- Install Xcode Command Line Tools
	```
	xcode-select --install
	```
	- Install [Homebrew](https://brew.sh)
- Change login shell
	- Install bash
	```
	brew install bash
	```
	- Change shell to dummy, non-symlink executable
	```
	mv /opt/homebrew/bin/bash /opt/homebrew/bin/bash.bak
	touch /opt/homebrew/bin/bash
	chmod +x /opt/homebrew/bin/bash
	open -R /opt/homebrew/bin/bash
	open x-apple.systempreferences:com.apple.preferences.users
	```
	- Restore original symlink in place of dummy executable
	```
	rm /opt/homebrew/bin/bash
	mv /opt/homebrew/bin/bash.bak /opt/homebrew/bin/bash
	```
- Install [dotfiles](https://github.com/jan4843/dotfiles/wiki)
- Install apps and programs
	- Install base packages
	```
	brew bundle --no-upgrade --no-lock --file=brew/base.rb
	```
	- Install machine-specific packages
- Grant Privacy permissions
	- Microphone
	```
	open permissions/microphone x-apple.systempreferences:com.apple.preference.security?Privacy_Microphone
	```
	- Camera
	```
	open permissions/camera x-apple.systempreferences:com.apple.preference.security?Privacy_Camera
	```
	- Full Disk Access
	```
	open permissions/full-disk-access x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles
	```
	- Accessibility
	```
	open permissions/accessibility x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility
	```
	- Screen Recording
	```
	open permissions/screen-recording x-apple.systempreferences:com.apple.preference.security?Privacy_ScreenCapture
	```
	- App Management
	```
	open permissions/app-management x-apple.systempreferences:com.apple.preference.security?Privacy_AppBundles
	```
	- Developer Tools
	```
	open permissions/developer-tools x-apple.systempreferences:com.apple.preference.security?Privacy_DevTools
	```
- Set up Maestral
```
mkdir -p ~/Library/Dropbox
open -R ~/Library/Dropbox
open -a Maestral
```
- Apply settings  
Explicitly confirm execution with `y`
```
find settings/*/* -ok bash {} \;
```
- Restore restic backup
```
set -a
. ~/.config/restic/config
restic restore --target="$HOME" --verify
```
