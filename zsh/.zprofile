#!/usr/bin/env zsh

if [ -f "$HOME"/.profile ]
then
    emulate sh -c ". $HOME/.profile"
fi

typeset -gU cdpath fpath path
