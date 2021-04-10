#!/bin/sh

nixsh="${HOME}/.nix-profile/etc/profile.d/nix.sh"

if [ -e "${nixsh}" ]; then
    # shellcheck disable=SC1090
    . "${nixsh}"

    export NIXPKGS_ALLOW_UNFREE="1"
fi

unset nixsh
