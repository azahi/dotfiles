#!/bin/sh

nixsh="${HOME}/.nix-profile/etc/profile.d/nix.sh"

if [ -e "${nixsh}" ]; then
    # shellcheck disable=SC1090
    . "${nixsh}"

    export NIXPKGS_ALLOW_UNFREE="1"

    hm_vars="$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    if [ -e "${hm_vars}" ]; then
        . "${hm_vars}"
    fi
    unset hm_vars;
fi

unset nixsh
