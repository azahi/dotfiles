#!/bin/sh

if command -v man >/dev/null 2>&1; then
	export MANOPT="--no-hyphenation"

	alias man="LANG=\"C\" LC_MESSAGES=\"C\" man"
fi
