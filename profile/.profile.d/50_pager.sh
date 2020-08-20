#!/bin/sh

for i in bat ccat less more cat
do
    # shellcheck disable=SC2139
    command -v "$i" >/dev/null 2>&1 && \
        export PAGER="$i" && \
        export MANPAGER="${PAGER}" && \
        alias p="${PAGER}" && \
        break
done
