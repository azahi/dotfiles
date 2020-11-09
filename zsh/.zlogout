#!/usr/bin/env zsh

if [ -f "${HOME}/.bin/logout-hook" ]
then
    source "${HOME}/.bin/logout-hook"

    for i in "${HOME}"/.*.zwc.old
    do
        rm_existing "${i}"
    done

    for i in "${HOME}"/.zsh.d/*.zwc.old
    do
        rm_existing "${HOME}"/.zsh.d/*.zwc.old
    done
fi
