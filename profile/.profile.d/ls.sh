#!/bin/sh
# shellcheck disable=SC2139

_gnu_ls="--color=always --human-readable --group-directories-first --indicator-style=classify --author"
_bsd_ls="-G -p"

if ls --color "${HOME}" >/dev/null 2>&1; then
	alias ls="ls ${_gnu_ls} -C"
	alias la="ls ${_gnu_ls} -C -A"
	alias ll="ls ${_gnu_ls} -l -A"
else
	if command -v gls >/dev/null 2>&1; then
		alias ls="gls ${_gnu_ls} -C"
		alias la="gls ${_gnu_ls} -C -A"
		alias ll="gls ${_gnu_ls} -l -A"
	else
		alias ls="ls ${_bsd_ls}"
		alias la="ls ${_bsd_ls} -A"
		alias ll="ls ${_bsd_ls} -A -l"
	fi
fi

alias l="ll"

unset _bsd_ls _gnu_ls
