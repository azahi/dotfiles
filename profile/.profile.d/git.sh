#!/bin/sh

if command -v git >/dev/null 2>&1; then
    if command -v hub >/dev/null 2>&1; then
        alias git="hub"
    fi
    alias g="git"
fi
