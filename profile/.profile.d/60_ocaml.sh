#!/bin/sh

if command -v opam >/dev/null 2>&1; then
	if [ -f "${HOME}/.opam/opam-init/init.sh" ]; then
		# shellcheck disable=SC1091
		. "${HOME}/.opam/opam-init/init.sh" >/dev/null 2>&1
	fi
fi
