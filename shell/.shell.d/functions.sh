#!/bin/sh

if command -v open >/dev/null 2>&1
then
    o()
    {
        if [ $# -eq 0 ]
        then
            open .
        else
            open "$@"
        fi
    }
fi

if command -v jot >/dev/null 2>&1
then
    hr()
    {
        jot -b '═' -s '' "$(tput cols)"
    }
fi

strstrip()
{
    printf "%s\n" "${1/$2}"
}

strstrip-all()
{
    printf "%s\n" "${1//$2}"
}

strtrim()
{
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf "%s\n" "$_"
}

strtrim-all()
{
    set -f
    set -- $*
    printf "%s\n" "$*"
    set +f
}

strtrim-quotes()
{
    : "${1//\'}"
    printf "%s\n" "${_//\"}"
}

strlwr()
{
    printf '%s\n' "${1,,}"
}

strupr()
{
    printf '%s\n' "${1^^}"
}

count()
{
    printf "%s\n" "$#"
}

dec2hex()
{
    printf "0x%X\n" "$1"
}

hex2dec()
{
    printf "%d\n" "0x$1"
}
