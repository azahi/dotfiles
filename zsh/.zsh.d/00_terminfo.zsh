#!/usr/bin/env zsh

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} ))
then
    function zle-line-init ()
    {
        echoti smkx
    }
    zle -N zle-line-init

    function zle-line-finish ()
    {
        echoti rmkx
    }
    zle -N zle-line-finish
fi
