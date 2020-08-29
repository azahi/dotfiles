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

    FLIST=(
        ${ZCOMPDUMP}
        ${ZLOGIN}
        ${ZLOGOUT}
        ${ZPROFILE}
        ${ZSHENV}
        ${ZSHRC}
        ${HOME}/.zsh.d/*.zsh
    )

    for i in ${FLIST}
    do
        lazy_zrecompile "${i}"
    done
) &!
