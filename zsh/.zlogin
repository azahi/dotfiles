#!/usr/bin/env zsh

(
    autoload -U zrecompile

    lazy_zrecompile()
    {
        if [[ -s "${1}" && ( ! -s "${1}.zwc" || "${1}" -nt "${1}.zwc" ) ]]
        then
            zrecompile -pq "${1}"
        fi
    }

    lazy_zrecompile "$ZCOMPDUMP"
    lazy_zrecompile "$ZLOGIN"
    lazy_zrecompile "$ZLOGOUT"
    lazy_zrecompile "$ZPROFILE"
    lazy_zrecompile "$ZSHENV"
    lazy_zrecompile "$ZSHRC"
) &!
