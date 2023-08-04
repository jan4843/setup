#!/bin/bash

is_installed() {
	random=$(tr -dc a-z0-9 </dev/random | head -c21)
	curl -f "https://${random}-dnscheck.adguard-dns.com/dnscheck/test" >/dev/null 2>&1
}

echo "installed..."
if ! is_installed; then
	curl -so /tmp/adguard-dns.mobileconfig https://cdn.adguard.com/public/Dns/adguard-dns.mobileconfig
	open /tmp/adguard-dns.mobileconfig
	open x-apple.systempreferences:com.apple.preferences.configurationprofiles
fi
while ! is_installed; do
	sleep 1
done
