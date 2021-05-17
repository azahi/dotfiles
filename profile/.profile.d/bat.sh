#!/bin/sh

if command -v bat >/dev/null 2>&1; then
	export BAT_THEME="base16"

	if [ "${MANPAGER}" == "bat" ]; then
		export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	fi
fi
