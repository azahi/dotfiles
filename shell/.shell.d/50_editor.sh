#!/bin/sh

for i in nvim vim vi emacs nano ed open
do
    command -v "$i" > /dev/null 2>&1 && \
        export EDITOR="$i" VISUAL="$i" && \
        break
done