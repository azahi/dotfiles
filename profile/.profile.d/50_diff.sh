#!/bin/sh

for i in batdiff cdiff colordiff diff
do
    # shellcheck disable=SC2139
    command -v "$i" >/dev/null 2>&1 && \
        export DIFF="$i" && \
        alias d="${DIFF}" && \
        break
done
