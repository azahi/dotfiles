#!/bin/sh

_pagers="
bat
less
more
cat
"

for _pager in ${_pagers}; do
	# shellcheck disable=SC2139
	if command -v "${_pager}" >/dev/null 2>&1; then
		export PAGER="${_pager}" MANPAGER="${_pager}"

		alias p="${PAGER}"
		if ! command -v pa >/dev/null 2>&1; then
			alias pa="${PAGER}"
		fi

		break
	fi
done

unset _pager _pagers
