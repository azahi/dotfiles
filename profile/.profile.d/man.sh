#!/bin/sh

if command -v man >/dev/null 2>&1
then
    if [ "$MANPAGER" == "bat" ]
    then
        export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    fi

    if command -v batman >/dev/null 2>&1
    then
        alias man="batman"
    fi
fi
