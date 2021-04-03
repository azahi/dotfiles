#!/bin/sh

if command -v opam >/dev/null 2>&1; then
    # shellcheck disable=SC1090
    if [ -f "${HOME}/.opam/opam-init/init.sh" ]; then
        . "${HOME}/.opam/opam-init/init.sh" >/dev/null 2>&1
    fi
fi
