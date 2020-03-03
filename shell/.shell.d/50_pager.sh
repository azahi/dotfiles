#!/bin/sh

for i in bat less more cat
do
    command -v "$i" > /dev/null 2>&1 && \
        export PAGER="$i" && \
        export MANPAGER="$PAGER" && \
        break
done
