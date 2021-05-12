#!/bin/sh

_implementations="
    nvim
    vim
    vi
"

for _implementation in ${_implementations}; do
	# shellcheck disable=SC2139
	command -v "${_implementation}" >/dev/null 2>&1 &&
		alias vim="${_implementation}" &&
		alias vi="${_implementation}" &&
		alias v="${_implementation}" &&
		break
done

if [ "${_implementation}" = "nvim" ]; then
	export NVIM_TUI_ENABLE_TRUE_COLOR="1"
fi

unset _implementation _implementations
