#!/bin/sh

_editors="
nvim
vim
vi
emacs
nano
ed
"

for _editor in ${_editors}; do
	# shellcheck disable=SC2139
	if command -v "${_editor}" >/dev/null 2>&1; then
		export EDITOR="${_editor}" VISUAL="${_editor}"

		alias e="${EDITOR}"
		if ! command -v ed >/dev/null 2>&1; then
			alias ed="${EDITOR}"
		fi

		break
	fi
done

unset _editor _editors
