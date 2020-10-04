#!/bin/sh

if [ -x "${HOME}/.emacs.d/bin/doom" ]
then
    path_prepend "${HOME}/.emacs.d/bin"
fi
