#!/bin/bash

profile=$1

brewfile_content() {
	cat brew/base.rb
	if [ "$profile" != base ]; then
		cat "brew/$profile.rb"
	fi
}

/opt/homebrew/bin/brew bundle --no-upgrade --no-lock --file=<(brewfile_content) |
grep -v 'Homebrew Bundle complete!'
