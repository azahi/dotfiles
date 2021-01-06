#!/bin/sh
# shellcheck disable=SC2039

count()
{
    printf "%d\n" "${#}"
}

strlwr()
{
    printf "%s\n" "${1,,}"
}

strupr()
{
    printf "%s\n" "${1^^}"
}

dec2hex()
{
    printf "0x%X\n" "${1}"
}

hex2dec()
{
    printf "%d\n" "0x${1}"
}

sponge()
{
    local tmp

    tmp="$(mktemp)" || return
    cat > "${tmp}"
    cat -- "${tmp}"
    rm -f -- "${tmp}"
}

ff()
{
    find . -type f -iname "${@}" -ls
}

mkcd()
{
    mkdir -p "${1}" && \
        builtin cd "${1}" || \
        return
}

mvcd()
{
    mv -i -- "${PWD}" "${1}" && \
        builtin cd . || \
        return
}

bak()
{
    local f ext="bak"

    for f do
        cp -i -- "${f}" "${f}.${ext}"
    done
}

ubak()
{
    local f ext="bak"

    for f do
        if [[ "${f}" = *.${ext} ]]
        then
            cp -i -- "${f}" "${f%.${ext}}"
        else
            cp -i -- "${f}.${ext}" "${f}"
        fi
    done
}

myip()
{
    dig -4 +short @resolver1.opendns.com myip.opendns.com A
}

myip6()
{
    dig -6 +short @resolver1.opendns.com myip.opendns.com AAAA
}
