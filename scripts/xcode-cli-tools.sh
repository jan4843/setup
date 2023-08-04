#!/bin/bash

is_installed() {
	test -e /Library/Developer/CommandLineTools
}

echo "installed..."
if ! is_installed; then
	xcode-select --install
fi
while ! is_installed; do
	sleep 1
done
