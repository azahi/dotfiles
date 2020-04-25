#!/bin/sh

if command -v ccache >/dev/null 2>&1
then
    export CCACHE_DIR="$HOME/.ccache"
    if [ -f "/usr/lib/ccache/bin" ]
    then
        export CCACHE_PATH="/usr/lib/ccache/bin:$PATH"
    else
        export CCACHE_PATH="$PATH"
    fi
fi
