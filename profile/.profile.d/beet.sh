#!/bin/sh

if command -v beet >/dev/null 2>&1; then
	export BEETSDIR="${XDG_DATA_HOME}/beets"

	_beets_config="${XDG_CONFIG_HOME}/beets/config.yaml"
	if [ -f "${_beets_config}" ]; then
		# shellcheck disable=SC2139
		alias beet="beet -c ${_beets_config}"
	fi
fi

unset _beets_config
