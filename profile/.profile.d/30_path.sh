#!/bin/sh

path_append ()
{
    [ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
    [ -d "$1" ] || return
    eval echo \$$PATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
    eval export $PATHVAR="\$$PATHVAR:$1"
}

path_prepend ()
{
    [ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
    [ -d "$1" ] || return
    eval echo \$$PATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
    eval export $PATHVAR="$1:\$$PATHVAR"
}

path_prepend "/sbin"
path_prepend "/usr/sbin"
path_prepend "/usr/local/sbin"
path_prepend "/bin"
path_prepend "/usr/bin"
path_prepend "/usr/local/bin"
path_prepend "${HOME}/.bin"
path_prepend "${HOME}/.local/bin"
