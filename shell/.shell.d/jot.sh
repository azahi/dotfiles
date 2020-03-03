#!/bin/sh

if command -v jot >/dev/null 2>&1
then
    # shellcheck disable=SC2139
    alias hr="jot -b '═' -s '' '$(tput cols)'"
fi
