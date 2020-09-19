#!/bin/sh

for i in qutebrowser firefox surf w3m lynx elinks links
do
    # shellcheck disable=SC2139
    command -v "$i" >/dev/null 2>&1 && \
        export BROWSER="$i" && \
        alias b="${BROWSER}" && \
        break
done
