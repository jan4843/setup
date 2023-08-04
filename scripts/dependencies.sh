#!/bin/bash

echo "Xcode Command Line Tools..."
if ! [ -e /Library/Developer/CommandLineTools/usr/bin/git ]; then
	xcode-select --install
fi
while ! [ -e /Library/Developer/CommandLineTools/usr/bin/git ]; do
	sleep 1
done

echo "Homebrew..."
if ! [ -e /opt/homebrew ]; then
	export NONINTERACTIVE=1
	sudo -v
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
