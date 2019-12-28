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
    printf "0x%X\n" "$1"
}

hex2dec()
{
    printf "%d\n" "0x$1"
}
