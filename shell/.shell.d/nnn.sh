#!/bin/sh

if command -v nnn > /dev/null 2>&1
then
    export NNN_BMS="s:~/src;d:~/downloads;e:/etc;u:/usr;p:/etc/portage;t:/tmp;m:~/media/marisa;g:~/media/glider"
    export NNN_PLUG="j:autojump"
    export NNN_MULTISCRIPT=1
    export NNN_NO_AUTOSELECT=1
    export NNN_OPENER="nuke"
    export NNN_QUOTE_ON=1
    export NNN_TMPFILE="$XDG_CACHE_HOME/nnn"
    export NNN_TRASH=0
    export NNN_USE_EDITOR=1

    alias n="nnn"

    alias ncp="cat ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection | tr '\0' '\n'"
fi
