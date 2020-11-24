#!/usr/bin/env zsh

if [ -f "${HOME}/.bin/logout-hook" ]
then
    source "${HOME}/.bin/logout-hook"

    #rm_existing "${HOME}"/.*.zwc.old
    #rm_existing "${HOME}"/.zsh.d/*.zwc.old
fi
