#!/bin/sh

for i in nvim vim vi
do
    # shellcheck disable=SC2139
    command -v "$i" > /dev/null 2>&1 && \
        alias vim="$i" && \
        alias v="$i" && \
        break
done
