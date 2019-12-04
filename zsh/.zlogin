#!/usr/bin/env zsh

(
    setopt local_options
    setopt extended_glob

    autoload -U zrecompile

    zrecompile -pq "$ZLOGIN"
    zrecompile -pq "$ZLOGOUT"
    zrecompile -pq "$ZPROFILE"
    zrecompile -pq "$ZSHENV"
    zrecompile -pq "$ZSHRC"
    if [[ -s "$ZCOMPDUMP" && ( ! -s "$ZCPMDUMP.zwc" || "$ZCOMPDUMP" -nt "$ZCOMPDUMP.zwc" ) ]]
    then
        zrecompile -pq "$ZCOMPDUMP"
    fi
) &!
