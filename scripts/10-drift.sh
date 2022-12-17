#!/bin/bash

PROFILE=$1
TCC_DB_PATH="/Library/Application Support/com.apple.TCC/TCC.db"

brewfile_content() {
	cat brew/base.rb
	if [ "$PROFILE" != base ]; then
		cat "brew/$PROFILE.rb"
	fi
}

expected_brewfile() {
	brewfile_content |
	grep '^tap '

	brewfile_content |
	grep -v '^tap ' |
	grep . |
	sort -u
}

current_brewfile() {
	brew tap |
	xargs -I{} printf 'tap "%s"\n' {}

	brew leaves |
	xargs -I{} printf 'brew "%s"\n' {}

	(
		cd /tmp || true
		brew bundle dump
		cat Brewfile
		rm Brewfile
	) | grep -Ev '^(tap|brew) '
}

brewfile_drift() {
	diff -U0 <(expected_brewfile) <(current_brewfile) |
	awk -F\+ '/^[+][^+]/ { print $2 }'
}

app_path() {
	osascript 2> /dev/null <<-EOF
	tell application "Finder"
		return POSIX path of (application file id "$1" as text)
	end tell
	EOF
}

permissions_drift() {
	for db_path in "$TCC_DB_PATH" "$HOME/$TCC_DB_PATH"; do
		sqlite3 "$db_path" "select service, client from access where auth_value != 0"
	done |
	sort -u |
	while IFS=\| read -r permission bundle_id; do
		local permissions_dir=
		local app_path=
		case $permission in
			kTCCServiceAccessibility)          permissions_dir="accessibility";;
			kTCCServiceSystemPolicyAppBundles) permissions_dir="app-management";;
			kTCCServiceBluetoothAlways)        permissions_dir="bluetooth";;
			kTCCServiceDeveloperTool)          permissions_dir="developer-tools";;
			kTCCServiceSystemPolicyAllFiles)   permissions_dir="full-disk-access";;
			kTCCServiceListenEvent)            permissions_dir="input-monitoring";;
			kTCCServiceMediaLibrary)           permissions_dir="media";;
			kTCCServiceScreenCapture)          permissions_dir="screen-recording";;
		esac
		[ -n "$permissions_dir" ] || continue
		app_path=$(app_path "$bundle_id")
		[ -n "$app_path" ] || continue

		if ! [ -L "permissions/$permissions_dir/$(basename "$app_path")" ]; then
			printf 'ln -s %q %q\n' "$app_path" "permissions/$permissions_dir"
		fi
	done
}

brewfile_drift
permissions_drift
