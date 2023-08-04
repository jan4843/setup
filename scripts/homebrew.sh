#!/bin/bash

echo "installed..."
if ! [ -e /opt/homebrew ]; then
	export NONINTERACTIVE=1
	sudo -v
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
