#!/bin/sh

PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

path_append()
{
    [ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
    [ -d "$1" ] || return
    eval echo \$$PATHVAR | /bin/grep -q "\(:\|^\)$1\(:\|$\)" && return
    eval export $PATHVAR="\$$PATHVAR:$1"
}

path_prepend()
{
    [ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
    [ -d "$1" ] || return
    eval echo \$$PATHVAR | /bin/grep -q "\(:\|^\)$1\(:\|$\)" && return
    eval export $PATHVAR="$1:\$$PATHVAR"
}

path_append "${HOME}/.bin"
path_append "${HOME}/.local/bin"
