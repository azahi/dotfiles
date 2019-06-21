#!/usr/bin/env zsh

path-append()
{
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]
    then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

path-prepend()
{
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]
    then
        PATH="$1${PATH:+":$PATH"}"
    fi
}

count()
{
    printf '%d\n' "$#"
}
