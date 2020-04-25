#!/bin/sh

if command -v bear >/dev/null 2>&1
then
    if command -v nproc >/dev/null 2>&1
    then
        alias m="bear make -j$(($(nproc) + 1))"
    else
        alias m="bear make"
    fi
fi
