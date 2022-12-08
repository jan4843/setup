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

echo "rclone config..."
mkdir -p ~/.config/rclone
if ! [ -e ~/.config/rclone/rclone.conf ]; then
	open ~/.config/rclone
fi
while ! [ -e ~/.config/rclone/rclone.conf ]; do
	sleep 1
done
chmod go= ~/.config/rclone/*

echo "restic config..."
mkdir -p ~/.config/restic
if ! [ -e ~/.config/restic/config ]; then
	open ~/.config/restic
fi
while ! [ -e ~/.config/restic/config ]; do
	sleep 1
done
chmod go= ~/.config/restic/*
