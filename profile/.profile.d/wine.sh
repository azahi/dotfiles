#!/bin/sh
#shellcheck disable=SC2139

if command -v wine >/dev/null 2>&1; then
    export WINEARCH="win64"
    export WINEDEBUG="+all"
    export WINEDLLOVERRIDES="winemenubuilder.exe=d"
    export WINEPREFIX="${HOME}/.wine"

    if command -v xrandr >/dev/null 2>&1; then
        alias wine-run="wine explorer.exe /desktop=default,$(xrandr | grep '\*' | cut -d' ' -f4)"
    fi
fi
