#!/bin/bash

ssh_id_exists() {
	set -- ~/.ssh/id_*
	test -e "$1" && test -e "$1".pub
}

echo "SSH key..."
mkdir -p ~/.ssh
chmod go= ~/.ssh
if ! ssh_id_exists; then
	open ~/.ssh
fi
while ! ssh_id_exists; do
	sleep 1
done
chmod go= ~/.ssh/id_*
chmod go+r ~/.ssh/id_*.pub
