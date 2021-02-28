#!/bin/sh

_pagers="
    slit
    moar
    most
    less
    more
    cat
"

for _pager in ${_pagers}; do
    # shellcheck disable=SC2139
    if command -v "${_pager}" >/dev/null 2>&1; then
        export PAGER="${_pager}" MANPAGER="${_pager}"

        alias p="${PAGER}"

        break
    fi
done

unset _pager _pagers
