#!/usr/bin/env zsh

skip_global_compinit=true

setopt noglobalrcs

export ZCOMPDUMP="${XDG_CACHE_HOME:-ZDOTDIR:-$HOME}/.zcompdump"
export ZLOGIN="${ZDOTDIR:-$HOME}/.zlogin"
export ZPROFILE="${ZDOTDIR:-$HOME}/.zprofile"
export ZSHENV="${ZDOTDIR:-$HOME}/.zshenv"
export ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "$ZPROFILE" ]]
then
    source "$ZPROFILE"
fi
