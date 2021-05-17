#!/bin/sh
# shellcheck disable=SC2139

if command -v bear >/dev/null 2>&1; then
	_implementations="
remake
make
	"

	for _implementation in ${_implementations}; do
		if command -v "${_implementation}" >/dev/null 2>&1; then
			if command -v nproc >/dev/null 2>&1; then
				alias m="bear ${_implementation} --jobs=$(($(nproc) + 1))"
			else
				alias m="bear ${_implementation}"
			fi
			alias mc="${_implementation} clean"

			break
		fi
	done
	unset _implementation _implementations
fi
