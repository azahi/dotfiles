#!/bin/sh

if ls --color "$HOME" >/dev/null 2>&1
then
    alias ls="ls --color=auto --group-directories-first --human-readable --indicator-style=classify"
    alias la="ls --color=auto --group-directories-first --human-readable --indicator-style=classify --almost-all"
    alias ll="ls --color=auto --group-directories-first --human-readable --indicator-style=classify --almost-all --format=verbose"
else
    if command -v gls >/dev/null 2>&1
    then
        alias ls="gls --color=auto --group-directories-first --human-readable --indicator-style=classify"
        alias la="gls --color=auto --group-directories-first --human-readable --indicator-style=classify --almost-all"
        alias ll="gls --color=auto --group-directories-first --human-readable --indicator-style=classify --almost-all --format=verbose"
    else
        alias ls="ls -G -p"
        alias la="ls -G -p -A"
        alias ll="ls -G -p -A -l"
    fi
fi

alias l="ll"
