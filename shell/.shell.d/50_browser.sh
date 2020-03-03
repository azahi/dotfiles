#!/bin/sh

for i in qutebrowser palemoon firefox chromium chrome safari w3m lynx elinks links open
do
    command -v "$i" > /dev/null 2>&1 && \
        export BROWSER="$i" && \
        break
done
