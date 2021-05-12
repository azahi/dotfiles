#!/bin/sh

nix_sh="${HOME}/.nix-profile/etc/profile.d/nix.sh"

if [ -e "${nix_sh}" ]; then
	# shellcheck disable=SC1090
	. "${nix_sh}"

	export NIXPKGS_ALLOW_UNFREE="1"

	hm_session_vars="$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
	if [ -e "${hm_session_vars}" ]; then
		# shellcheck disable=SC1090
		. "${hm_session_vars}"
	fi
	unset hm_session_vars
fi

unset nix_sh
