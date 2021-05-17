#!/bin/sh

_diffs="
colordiff
diff
"

for _diff in ${_diffs}; do
	# shellcheck disable=SC2139
	if command -v "${_diff}" >/dev/null 2>&1; then
		export DIFF="${_diff}"

		alias d="${DIFF}"
		if ! command -v di; then
			alias di="${DIFF}"
		fi

		break
	fi
done

unset _diff _diffs
