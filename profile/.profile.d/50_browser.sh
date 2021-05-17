#!/bin/sh

_browsers="
qutebrowser
chromium
chromium-browser
firefox
lynx
w3m
elinks
links
"

for _browser in ${_browsers}; do
	# shellcheck disable=SC2139
	if command -v "${_browser}" >/dev/null 2>&1; then
		export BROWSER="${_browser}"

		alias b="${BROWSER}"
		if ! command -v br; then
			alias br="${BROWSER}"
		fi

		break
	fi
done

unset _browser _browsers
