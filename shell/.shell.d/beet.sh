#!/bin/sh

if command -v beet > /dev/null 2>&1
then
    export BEETSDIR="$XDG_DATA_HOME/beets"

    # shellcheck disable=SC2139
    [ -f "$XDG_CONFIG_HOME/beets/config.yaml" ] && \
        alias beet="beet -c $XDG_CONFIG_HOME/beets/config.yaml"
fi
