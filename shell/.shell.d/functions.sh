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

strstrip_s()
{
    printf "%s\n" "${1##$2}"
}

strstrip_e()
{
    printf "%s\n" "${1%%$2}"
}

strtrim()
{
    trim=${1#${1%%[![:space:]]*}}
    trim=${trim%${trim##*[![:space:]]}}

    printf "%s\n" "$trim"
}

strtrim_quotes()
{
    set -f
    old_ifs=$IFS
    IFS=\"\'
    # shellcheck disable=2086
    set -- "$1"
    IFS=
    printf "%s\n" "$*"
    IFS=$old_ifs
    set +f
}

strtrim_all()
{
    set -f
    # shellcheck disable=SC2086,SC2048
    set -- $*
    printf "%s\n" "$*"
    set +f
}

strsplit() {
    set -f
    old_ifs=$IFS
    IFS=$2
    # shellcheck disable=2086
    set -- "$1"
    printf "%s\n" "$@"
    IFS=$old_ifs
    set +f
}

count()
{
    printf "%s\n" "$#"
}

lines()
{
    while read -r _
    do
        lines=$((lines+1))
    done < "$1"

    printf "%s\n" "$lines"
}

if ! command -v head >/dev/null 2>&1
then
    head()
    {
        while read -r line
        do
            [ "$i" = "$1" ] && break
            printf "%s\n" "$line"
            i=$((i+1))
        done < "$2"
    }
fi

if ! command -v touch >/dev/null 2>&1
then
    touch()
    {
        :>file
    }
fi

if ! command -v dirname >/dev/null 2>&1
then
    dirname() {
        dir=${1%%/}
        [ "${dir##*/*}" ] && dir=.
        dir=${dir%/*}

        printf "%s\n" "${dir:-/}"
    }
fi

if ! command -v basename >/dev/null 2>&1
then
    basename() {
        dir=${1%${1##*[!/]}}
        dir=${dir##*/}
        dir=${dir%"$2"}

        printf "%s\n" "${dir:-/}"
    }
fi

isfloat()
{
    case "$1" in
        *.*.*|*[!-.0-9]*)
            ;;
        *[0-9].[0-9]*)
            return 0
    esac

    return 1
}

isint()
{
    case "$1" in
        *[!-0-9]*|'')
            return 1
            ;;
        *[0-9]*)
    esac
}

dec2hex()
{
    printf "0x%X\n" "$1"
}

hex2dec()
{
    printf "%d\n" "0x$1"
}
