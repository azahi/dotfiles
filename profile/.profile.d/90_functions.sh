#!/bin/sh

count() {
	printf "%d\n" "${#}"
}

dec2hex() {
	printf "0x%X\n" "${1}"
}

hex2dec() {
	printf "%d\n" "0x${1}"
}

ff() {
	find . -type f -iname "${@}" -ls
}

mkcd() {
	mkdir -p "${1}" &&
		builtin cd "${1}" ||
		return
}

mvcd() {
	mv -i -- "${PWD}" "${1}" &&
		builtin cd . ||
		return
}

cald() {
	printf "\t\t%s\n\n" "$(date)" && cal -m -3
}

cheat() {
	curl "cheat.sh/${1}"
}

myip() {
	dig -4 +short @resolver1.opendns.com myip.opendns.com A
}

myip6() {
	dig -6 +short @resolver1.opendns.com myip.opendns.com AAAA
}

if ! command -v sponge >/dev/null 2>&1; then
	sponge() {
		_tmp="$(mktemp)" || return

		cat >"${_tmp}"
		cat -- "${_tmp}"
		rm -f -- "${_tmp}"

		unset _tmp
	}
fi
