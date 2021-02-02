#!/usr/bin/env zsh

for i in "${HOME}"/.zsh.d/*.zsh
do
    [[ -r "$i" ]] && . "$i"
done
