#!/bin/sh

manpath_append()
{
    [ $# -eq 2 ] && MANPATHVAR=$2 || MANPATHVAR=MANPATH
    [ -d "$1" ] || return
    eval echo \$$MANPATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
    eval export $MANPATHVAR="\$$MANPATHVAR:$1"
}

manpath_prepend()
{
    [ $# -eq 2 ] && MANPATHVAR=$2 || MANPATHVAR=MANPATH
    [ -d "$1" ] || return
    eval echo \$$MANPATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
    eval export $MANPATHVAR="$1:\$$MANPATHVAR"
}

manpath_prepend "/usr/share/man"
manpath_prepend "/usr/local/share/man"
manpath_prepend "${HOME}/.local/share/man"
