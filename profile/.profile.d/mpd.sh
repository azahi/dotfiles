#!/bin/sh

MPD_HOST="/var/lib/mpd/mpd.socket"
if [ -f "${MPD_HOST}" ] \
&& pgrep mpd >/dev/null 2>&1
then
    export MPD_HOST
fi
