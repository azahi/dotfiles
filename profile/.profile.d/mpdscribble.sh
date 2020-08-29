#!/bin/sh

if command -v mpdscribble >/dev/null 2>&1 && [ -f "${XDG_CONFIG_HOME}/mpdscribble.conf" ]
then
    alias mpdscribble="mpdscribble --conf ${XDG_CONFIG_HOME}/mpdscribble.conf"
fi
