#!/bin/sh

_impls="
    gopass
    pass
"

for _impl in ${_impls}; do
	if command -v "${_impl}" >/dev/null 2>&1; then
		export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/password-store"

		break
	fi
done

unset _impl _impls
