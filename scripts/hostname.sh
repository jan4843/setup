#!/bin/bash

capitalize() {
	printf %s "$1" | awk '{print toupper(substr($0, 0, 1)) tolower(substr($0, 2))}'
}

hostify() {
	printf %s "$1" | sed -e 's/[^0-9A-Za-z ]//g' -e 's/ /-/g' -e 's/--*/-/g'
}

model=$(ioreg -r -k product-name | grep "product-name")
model=${model##*'<"'}
model=${model%%' ('*}
model=${model%%'">'*}

owner=$(capitalize "$USER")
[ "$PROFILE" != personal ] && profile=$(capitalize "$PROFILE")

computer_name="$owner’s ${profile:+$profile }$model"
hostname=$(hostify "$computer_name")

if [ "$(scutil --get HostName 2> /dev/null)" != "$hostname" ]; then
	sudo scutil --set HostName "$hostname"
fi
if [ "$(scutil --get LocalHostName 2> /dev/null)" != "$hostname" ]; then
	sudo scutil --set LocalHostName "$hostname"
fi
if [ "$(scutil --get ComputerName 2> /dev/null)" != "$computer_name" ] ; then
	sudo scutil --set ComputerName "$computer_name"
fi
