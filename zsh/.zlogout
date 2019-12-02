#!/usr/bin/env zsh

_clear_old()
{
    local suffix=".zwc.old"
    local file="$1$suffix"

    [ -f "$file" ] && \
        rm --force "$file"
}

_clear_old "$ZCOMPDUMP"
_clear_old "$ZLOGIN"
_clear_old "$ZLOGOUT"
_clear_old "$ZPROFILE"
_clear_old "$ZSHENV"
_clear_old "$ZSHRC"
