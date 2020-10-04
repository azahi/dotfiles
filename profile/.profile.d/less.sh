#!/bin/sh

if command -v less >/dev/null 2>&1
then
    export LESS="-R -f -X -i"
    export LESSHISTFILE="/dev/null"
fi
