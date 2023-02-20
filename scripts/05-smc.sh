#!/bin/bash
set -e

echo "installed..."
if [ -e /usr/local/bin/smc ]; then
	exit
fi

trap 'rm -rf /tmp/smcFanControl' EXIT

cd /tmp
git clone https://github.com/hholtmann/smcFanControl
cd smcFanControl
git checkout a38133947f54ddd261b3e3e977cc4bbb8457e574
cd smc-command
make
sudo chown -R root:wheel smc
sudo chmod u+s smc
sudo mv smc /usr/local/bin
