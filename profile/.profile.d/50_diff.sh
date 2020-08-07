#!/bin/sh

for i in cdiff colordiff diff
do
    command -v "$i" >/dev/null 2>&1 && \
        export DIFF="$i" && \
        alias d="${DIFF}" && \
        break

done
