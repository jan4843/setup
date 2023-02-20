#!/bin/bash

mkdir -p ~/.config/rclone
mkdir -p ~/.config/restic

echo "rclone config..."
if ! [ -e ~/.config/rclone/rclone.conf ]; then
	open ~/.config/rclone
fi
while ! [ -e ~/.config/rclone/rclone.conf ]; do
	sleep 1
done

echo "restic config..."
if ! [ -e ~/.config/restic/config ]; then
	open ~/.config/restic
fi
while ! [ -e ~/.config/restic/config ]; do
	sleep 1
done

chmod go= ~/.config/rclone/*
chmod go= ~/.config/restic/*
