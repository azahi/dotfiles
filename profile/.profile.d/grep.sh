#!/bin/sh

if command -v grep >/dev/null 2>&1; then
    alias gr="grep"

    if command -v batgrep >/dev/null 2>&1; then
        alias gr="batgrep"
    fi
fi

if command -v egrep >/dev/null 2>&1; then
    alias egr="egrep"
fi

if command -v pgrep >/dev/null 2>&1; then
    alias pgr="pgrep"
fi
