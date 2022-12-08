#!/bin/bash

TCC_DB_PATH="/Library/Application Support/com.apple.TCC/TCC.db"

is_tcc_readable() {
	sqlite3 "$TCC_DB_PATH" "" 2> /dev/null
}

is_tcc_permission_granted() {
	local db_owner=$1
	local permission=$2
	local bundle_id=$3

	local db_path="$TCC_DB_PATH"
	if [ "$db_owner" = user ]; then
		db_path="$HOME/$db_path"
	fi

	sqlite3 "$db_path" "
	SELECT 'access_granted'
	FROM access
	WHERE
		service = '$permission' AND
		client = '$bundle_id' AND
		auth_value != 0
	" | grep -q 'access_granted'
}

get_bundle_id() {
	info_path=$(realpath "$1/Contents/Info.plist" 2> /dev/null)
	defaults read "$info_path" CFBundleIdentifier 2> /dev/null
}

ensure_tcc_readable() {
	echo "TCC database readable..."
	if ! is_tcc_readable; then
		echo "Grant Full Disk Access to the app running this script"
		open x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles
	fi
	while ! is_tcc_readable; do
		sleep 1
	done
}

ensure_tcc_entries() {
	local apps_dir=$1
	local db_owner=$2
	local permission=$3
	local settings_pane=$4

	for app_path in "permissions/$apps_dir/"*; do
		bundle_id=$(get_bundle_id "$app_path")
		[ -n "$bundle_id" ] || continue

		echo "$app_path"
		if ! is_tcc_permission_granted "$db_owner" "$permission" "$bundle_id"; then
			open "x-apple.systempreferences:com.apple.preference.security?$settings_pane"
			open -R "$app_path"
			while ! is_tcc_permission_granted "$db_owner" "$permission" "$bundle_id"; do
				sleep 1
			done
			killall 'System Settings'
		fi
	done
}

ensure_tcc_readable

ensure_tcc_entries accessibility    root kTCCServiceAccessibility          Privacy_Accessibility
ensure_tcc_entries app-management   user kTCCServiceSystemPolicyAppBundles Privacy_AppBundles
ensure_tcc_entries bluetooth        user kTCCServiceBluetoothAlways        Privacy_Bluetooth
ensure_tcc_entries developer-tools  root kTCCServiceDeveloperTool          Privacy_DevTools
ensure_tcc_entries full-disk-access root kTCCServiceSystemPolicyAllFiles   Privacy_AllFiles
ensure_tcc_entries input-monitoring root kTCCServiceListenEvent            Privacy_ListenEvent
ensure_tcc_entries media            user kTCCServiceMediaLibrary           Privacy_Media
ensure_tcc_entries screen-recording root kTCCServiceScreenCapture          Privacy_ScreenCapture
