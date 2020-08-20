#!/bin/sh
# shellcheck disable=SC2139

GNU_LS_OPTS="--color=always --human-readable --group-directories-first --indicator-style=classify --author"
BSD_LS_OPTS="-G -p"

if ls --color "${HOME}" >/dev/null 2>&1
then
    alias ls="ls ${GNU_LS_OPTS} -C"
    alias la="ls ${GNU_LS_OPTS} -C -A"
    alias ll="ls ${GNU_LS_OPTS} -l -A"
else
    if command -v gls >/dev/null 2>&1
    then
        alias ls="gls ${GNU_LS_OPTS} -C"
        alias la="gls ${GNU_LS_OPTS} -C -A"
        alias ll="gls ${GNU_LS_OPTS} -l -A"
    else
        alias ls="ls ${BSD_LS_OPTS}"
        alias la="ls ${BSD_LS_OPTS} -A"
        alias ll="ls ${BSD_LS_OPTS} -A -l"
    fi
fi

alias l="ll"

unset GNU_LS_OPTS BSD_LS_OPTS
