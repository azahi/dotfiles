#!/bin/sh

if command -v units > /dev/null 2>&1
then
    # shellcheck disable=SC2139
    alias units="units --history=$XDG_DATA_HOME/units_history"
fi
