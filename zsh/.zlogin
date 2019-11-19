#!/usr/bin/env zsh

(
    setopt local_options
    setopt extendedglob

    autoload -U zrecompile

    if [[ -s "$ZCOMPDUMP" && ( ! -s "$ZCPMDUMP.zwc" || "$ZCOMPDUMP" -nt "$ZCOMPDUMP.zwc" ) ]]
    then
        zrecompile -pq "$ZCOMPDUMP"
    fi

    zrecompile -pq ${ZDOTDIR:-$HOME}/.zshrc
    zrecompile -pq ${ZDOTDIR:-$HOME}/.zprofile
    zrecompile -pq ${ZDOTDIR:-$HOME}/.zshenv
) &!
