#!/bin/sh

if command -v xauth > /dev/null 2>&1
then
    export XAUTHORITY="$XDG_DATA_HOME/xorg/.Xauthority"
fi
