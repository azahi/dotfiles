#!/bin/sh

if command -v less >/dev/null 2>&1
then
    export LESS="-R -f -X -i -P"
    export LESSHISTFILE="/dev/null"
fi
