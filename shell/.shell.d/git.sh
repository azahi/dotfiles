#!/bin/sh

if command -v git >/dev/null 2>&1
then
    command -v hub >/dev/null 2>&1 && \
        alias git="hub"
    alias g="git"
fi
