#!/bin/sh

if command -v emacs >/dev/null 2>&1 && [ -f "$HOME/.emacs.d/bin/doom" ]
then
    export DOOMDIR="$HOME/.doom.d"

    path_prepend "$HOME/.emacs.d/bin"
fi
