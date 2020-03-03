#!/bin/sh

if command -v nnn > /dev/null 2>&1
then
    export NNN_MULTISCRIPT=1
    export NNN_NO_AUTOSELECT=1
    export NNN_QUOTE_ON=1
    export NNN_TMPFILE="$XDG_CACHE_HOME/nnn"
    export NNN_TRASH=0
    export NNN_USE_EDITOR=1
    export NNN_OPENER="open"

    alias n="nnn"
fi
