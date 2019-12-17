#!/usr/bin/env zsh

skip_global_compinit=1

setopt no_global_rcs

export ZCOMPDUMP="$HOME/.zcompdump"
export ZLOGIN="$HOME/.zlogin"
export ZLOGOUT="$HOME/.zlogout"
export ZPROFILE="$HOME/.zprofile"
export ZSHENV="$HOME/.zshenv"
export ZSHRC="$HOME/.zshrc"

if [[ "$SHLVL" == 1 && ! -o LOGIN && -s "$ZPROFILE" ]]
then
    # shellcheck disable=SC1090
    source "$ZPROFILE"
fi
