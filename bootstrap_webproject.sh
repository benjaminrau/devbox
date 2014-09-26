#!/bin/sh

if [ "$1" != "" ]; then
	if [ ! -d "/data/web/" ]; then
		echo "Clone webproject to /data/web from $2"
		git clone -b master $2 /data/web/
	fi
fi