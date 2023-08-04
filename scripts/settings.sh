#!/bin/bash
set -e

for f in settings/*/*; do
	echo "$f"
	bash "$f"
done
