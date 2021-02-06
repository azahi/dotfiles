#!/bin/sh

_browsers="
    qutebrowser
    firefox
    chromium
    chromium-browser
    surf
    w3m
    lynx
    elinks
    links
"

for _browser in ${_browsers}; do
    # shellcheck disable=SC2139
    if command -v "${_browser}" >/dev/null 2>&1
    then
        export BROWSER="${_browser}"

        alias b="${BROWSER}"

        break
    fi
done

unset _browser _browsers
