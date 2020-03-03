#!/bin/sh

if ls --color > /dev/null 2>&1
then
    alias ls="ls --color=auto --group-directories-first --human-readable --indicator-style=classify"
    alias la="ls --color=auto --group-directories-first --human-readable --indicator-style=classify --almost-all"
    alias ll="ls --color=auto --group-directories-first --human-readable --indicator-style=classify --almost-all --format=verbose"
else
    alias ls="ls -G -p"
    alias la="ls -G -p -A"
    alias ll="ls -G -p -A -l"
fi

if command -v gls > /dev/null 2>&1
then
    alias gls="gls --color=auto --group-directories-first --human-readable --indicator-style=classify"
    alias gla="gls --color=auto --group-directories-first --human-readable --indicator-style=classify --almost-all"
    alias gll="gls --color=auto --group-directories-first --human-readable --indicator-style=classify --almost-all --format=verbose"
fi
