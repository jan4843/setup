#!/bin/bash

for f in settings/*/*; do
	echo "$f"
	bash "$f"
done
