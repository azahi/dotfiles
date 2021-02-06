#!/bin/sh

if command -v man >/dev/null 2>&1; then
    export MANOPT="--no-hyphenation"

    if command -v batman >/dev/null 2>&1; then
        alias man="batman"
    fi
fi
