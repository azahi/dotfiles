#!/bin/sh

if command -v brew > /dev/null 2>&1 || [ -d "$HOME/.brew" ]
then
    path_prepend "$HOME/.brew/sbin"
    path_prepend "$HOME/.brew/bin"

    export HOMEBREW_CACHE="$XDG_CACHE_HOME/homebrew/cache"
    export HOMEBREW_TEMP="$XDG_CACHE_HOME/homebrew/temp"

    [ ! -d "$HOMEBREW_CACHE" ] && mkdir -p "$HOMEBREW_CACHE"
    [ ! -d "$HOMEBREW_TEMP" ] && mkdir -p "$HOMEBREW_TEMP"

    if df -T autofs,nfs "$HOME" > /dev/null 2>&1
    then
        HOMEBREW_LOCKS_TARGET="$XDG_CACHE_HOME/homebrew/locks"
        HOMEBREW_LOCKS_FOLDER="$HOME/.brew/var/homebrew"

        [ ! -d "$HOMEBREW_LOCKS_TARGET" ] && mkdir -p "$HOMEBREW_LOCKS_TARGET"
        [ ! -d "$HOMEBREW_LOCKS_FOLDER" ] && mkdir -p "$HOMEBREW_LOCKS_FOLDER"

        if [ ! -L "$HOMEBREW_LOCKS_FOLDER" ] || [ ! -d "$HOMEBREW_LOCKS_FOLDER" ]
        then
            rm -rf "$HOMEBREW_LOCKS_FOLDER"
            ln -s "$HOMEBREW_LOCKS_TARGET" "$HOMEBREW_LOCKS_FOLDER"
        fi
    fi
fi

