#!/bin/sh

if command -v jot >/dev/null 2>&1
then
    alias hr="jot -b '═' -s '' '$(tput cols)'"
fi
