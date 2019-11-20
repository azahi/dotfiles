#!/usr/bin/env zsh

(
    setopt local_options
    setopt extendedglob

    autoload -U zrecompile

    zrecompile -pq $ZLOGIN
    zrecompile -pq $ZPROFILE
    zrecompile -pq $ZSHENV
    zrecompile -pq $ZSHRC
    if [[ -s "$ZCOMPDUMP" && ( ! -s "$ZCPMDUMP.zwc" || "$ZCOMPDUMP" -nt "$ZCOMPDUMP.zwc" ) ]]
    then
        zrecompile -pq "$ZCOMPDUMP"
    fi
) &!
