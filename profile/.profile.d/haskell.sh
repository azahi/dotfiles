#!/bin/sh

if command -v cabal >/dev/null 2>&1
then
    path_append "${HOME}/.cabal/bin"
fi
