#!/bin/sh

if command -v wine >/dev/null 2>&1
then
    export WINEARCH="win64"
    export WINEDEBUG="+all"
    export WINEDLLOVERRIDES="winemenubuilder.exe=d"
    export WINEPREFIX="$HOME/.wine"

    alias wine-vd="wine explorer.exe /desktop=default,$(xrandr | grep \* | cut -d' ' -f4)"
fi
