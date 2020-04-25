#!/bin/sh

if command -v opam >/dev/null 2>&1
then
    # shellcheck disable=SC1090
    [ -f "$HOME/.opam/opam-init/init.sh" ] &&
        . "$HOME/.opam/opam-init/init.sh" > /dev/null 2>&1
fi
