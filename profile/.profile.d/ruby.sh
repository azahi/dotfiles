#!/bin/sh

if command -v ruby >/dev/null 2>&1 || [ -d "${HOME}/.rvm" ]
then
    # shellcheck disable=SC1090
    if [ -s "${HOME}/.rvm/scripts/rvm" ]
    then
        . "${HOME}/.rvm/scripts/rvm"
    elif command -v gem >/dev/null 2>&1 && [ -d "${HOME}/.gem" ]
    then
        for i in "${HOME}/.gem/ruby/"*
        do
            path_prepend "$i/bin"
        done
    fi
fi
