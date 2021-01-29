#!/bin/sh

for i in nvim vim vi emacs xemacs nano sam acme ed
do
    # shellcheck disable=SC2139
    command -v "$i" >/dev/null 2>&1 && \
        export EDITOR="$i" VISUAL="$i" && \
        alias e="${EDITOR}" && \
        alias v="${VISUAL}" && \
        break
done
