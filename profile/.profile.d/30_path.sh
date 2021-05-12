#!/bin/sh

export PATH="/sbin:/bin:/usr/sbin:/usr/bin"

path_prepend() {
	[ ! -d "${1}" ] && return
	echo "${PATH}" | grep -q "\(:\|^\)${1}\(:\|$\)" && return
	export PATH="${1}:${PATH}"
}

path_append() {
	[ ! -d "${1}" ] && return
	echo "${PATH}" | grep -q "\(:\|^\)${1}\(:\|$\)" && return
	export PATH="${PATH}:${1}"
}

path_append "/usr/local/bin"
path_append "${HOME}/.bin"
path_append "${HOME}/.local/bin"
