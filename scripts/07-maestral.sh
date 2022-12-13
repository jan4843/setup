#!/bin/bash

DROPBOX_DIR="$HOME/Library/Dropbox"

configured_dir() {
	awk -F' *= *' '/^path/ { print $2 }' \
		"$HOME/Library/Application Support/maestral/maestral.ini"
}

up_to_date() {
	status=$(/Applications/Maestral.app/Contents/MacOS/maestral-cli filestatus "$DROPBOX_DIR")
	test "$status" = "up to date"
}

echo "installed..."
if ! [ -e /Applications/Maestral.app/Contents/MacOS/maestral-cli ]; then
	/opt/homebrew/bin/brew install --cask maestral
fi

echo "configured..."
mkdir -p "$DROPBOX_DIR"
if [ "$(configured_dir)" != "$DROPBOX_DIR" ]; then
	open -R "$DROPBOX_DIR"
fi
if ! lsappinfo info -only bundleID com.samschott.maestral-cocoa | grep -q .; then
	open /Applications/Maestral.app
fi
while [ "$(configured_dir)" != "$DROPBOX_DIR" ]; do
	sleep 1
done

echo "up to date..."
while ! up_to_date; do
	sleep 1
done
