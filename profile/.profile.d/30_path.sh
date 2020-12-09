#!/bin/sh

PATH=

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

path_append "/bin"
path_append "/sbin"

path_append "/usr/bin"
path_append "/usr/sbin"

path_append "/usr/local/sbin"
path_append "/usr/local/bin"

path_append "${HOME}/.bin"
path_append "${HOME}/.local/bin"
