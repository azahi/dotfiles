#!/bin/sh

if [ "$(uname)" = "Linux" ]; then
    if grep -q Microsoft /proc/version; then
        alias open="explorer.exe"
    elif command -v "xdg-open" >/dev/null 2>&1; then
        alias open="xdg-open"
    fi
fi

if command -v "open" >/dev/null 2>&1; then
    o() {
        if [ "${#}" -eq 0 ]; then
            open "${PWD}"
        else
            open "${@}"
        fi
    }
fi
