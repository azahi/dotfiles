#!/usr/bin/env zsh

skip_global_compinit=1

setopt NO_GLOBAL_RCS

export ZDOTDIR="${HOME}"
export ZCOMPDUMP="${ZDOTDIR}/.zsh.d/.zcompdump"
export ZLOGIN="${ZDOTDIR}/.zlogin"
export ZLOGOUT="${ZDOTDIR}/.zlogout"
export ZPROFILE="${ZDOTDIR}/.zprofile"
export ZSHENV="${ZDOTDIR}/.zshenv"
export ZSHRC="${ZDOTDIR}/.zshrc"

if [[ "${SHLVL}" -eq 1 && ! -o LOGIN && -s "${ZPROFILE}" ]]
then
    source "${ZPROFILE}"
fi
