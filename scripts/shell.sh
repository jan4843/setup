#!/bin/bash
set -e

SHELL_PATH=/opt/homebrew/bin/bash

is_installed() {
	test "$("$SHELL_PATH" -c 'echo yes')" = yes
}

is_login_shell() {
	# shellcheck disable=SC2016
	test "$(env -i sh -c 'echo $SHELL')" = "$SHELL_PATH"
}

echo "installed..."
if ! is_installed; then
	brew install bash
fi

echo "configured..."
if ! is_login_shell; then
	mv "$SHELL_PATH" "$SHELL_PATH".bak
	touch "$SHELL_PATH"
	chmod +x "$SHELL_PATH"
	open -R "$SHELL_PATH"
	open x-apple.systempreferences:com.apple.preferences.users

	while ! is_login_shell; do
		sleep 1
	done

	rm "$SHELL_PATH"
	mv "$SHELL_PATH".bak "$SHELL_PATH"
fi
