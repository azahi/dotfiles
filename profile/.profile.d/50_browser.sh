#!/bin/sh

for i in qutebrowser palemoon waterfox firefox firefox-esr chromium chrome lynx elinks links w3m open
do
    command -v "$i" >/dev/null 2>&1 && \
        export BROWSER="$i" && \
        alias b="${BROWSER}" && \
        break
done
