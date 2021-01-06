#!/bin/sh

if command -v cabal >/dev/null 2>&1
then
    export GHCFLAGS="-dynamic"

    path_append "${HOME}/.cabal/bin"
fi
