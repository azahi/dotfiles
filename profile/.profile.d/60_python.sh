#!/bin/sh

_implementations="
python
python3
python2
"

for _implementation in ${_implementations}; do
	if command -v "${_implementation}" >/dev/null 2>&1; then
		if [ -f "${HOME}/.pystartup" ]; then
			export PYTHONSTARTUP="${HOME}/.pystartup"
		fi

		break
	fi
done

unset _implementation _implementations
