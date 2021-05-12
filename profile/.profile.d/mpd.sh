#!/bin/sh

if command -v mpd >/dev/null 2>&1; then
	export MPD_HOST="/var/lib/mpd/mpd.socket"
fi
