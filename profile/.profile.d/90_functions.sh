#!/bin/sh

t()
{
    if [ -n "$1" ]
    then
        st -e "$@" &
    else
        st -e "${SHELL}" --login &
    fi
    disown
}

strlwr()
{
    printf '%s\n' "${1,,}"
}

strupr()
{
    printf '%s\n' "${1^^}"
}

dec2hex()
{
    printf "0x%X\n" "${1}"
}

hex2dec()
{
    printf "%d\n" "0x${1}"
}
