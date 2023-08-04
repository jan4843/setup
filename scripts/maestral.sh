#!/bin/bash

DROPBOX_DIR="$HOME/Library/Dropbox"

configured_dir() {
	awk -F' *= *' '/^path/ { print $2 }' \
		"$HOME/Library/Application Support/maestral/maestral.ini"
}

up_to_date() {
	/Applications/Maestral.app/Contents/MacOS/maestral-cli status |
	grep -iq "up to date"
}

if ! pgrep -qx Maestral; then
	open /Applications/Maestral.app
fi

echo "configured..."
if [ "$(configured_dir)" != "$DROPBOX_DIR" ]; then
	mkdir -p "$DROPBOX_DIR"
	open -R "$DROPBOX_DIR"
fi
while [ "$(configured_dir)" != "$DROPBOX_DIR" ]; do
	sleep 1
done

echo "up to date..."
while ! up_to_date; do
	sleep 1
done
