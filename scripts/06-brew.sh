#!/bin/bash

PROFILE=$1

brewfile_content() {
	cat brew/base.rb
	if [ "$PROFILE" != base ]; then
		cat "brew/$PROFILE.rb"
	fi
}

brew bundle --no-upgrade --no-lock --file=<(brewfile_content) |
grep -v 'Homebrew Bundle complete!'
