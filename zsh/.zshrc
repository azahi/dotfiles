#!/usr/bin/env zsh

if [[ $TERM == "dumb" ]]; then
    unsetopt zle
    return
fi

for i in "${HOME}"/.zsh.d/*.zsh
do
    [[ -r "$i" ]] && . "$i"
done
unset i
