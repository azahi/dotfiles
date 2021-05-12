#!/bin/sh

manpath_append() {
	[ ! -d "${1}" ] && return
	echo "${MANPATH}" | grep -q "\(:\|^\)${1}\(:\|$\)" && return
	export MANPATH="${MANPATH}:${1}"
}

manpath_prepend() {
	[ ! -d "${1}" ] && return
	echo "${MANPATH}" | grep -q "\(:\|^\)${1}\(:\|$\)" && return
	export MANPATH="${1}:${MANPATH}"
}

manpath_prepend "/usr/share/man"
manpath_prepend "/usr/local/share/man"
manpath_prepend "${HOME}/.local/share/man"
