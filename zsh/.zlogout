#!/usr/bin/env zsh

if [ -f "${HOME}/.bin/logout-hook" ]
then
    source "${HOME}/.bin/logout-hook"

    rm_existing "${ZCOMPDUMP}.zwc.old"
    rm_existing "${ZLOGIN}.zwc.old"
    rm_existing "${ZLOGOUT}.zwc.old"
    rm_existing "${ZPROFILE}.zwc.old"
    rm_existing "${ZSHENV}.zwc.old"
    rm_existing "${ZSHRC}.zwc.old"
fi
