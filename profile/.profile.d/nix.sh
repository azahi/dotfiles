#!/bin/sh

nixsh="${HOME}/.nix-profile/etc/profile.d/nix.sh"

if [ -e "${nixsh}" ]; then
    # shellcheck disable=SC1090
    . "${nixsh}"
fi

unset nixsh
