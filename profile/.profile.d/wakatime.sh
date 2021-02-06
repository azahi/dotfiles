#!/bin/sh

if command -v wakatime >/dev/null 2>&1; then
    export WAKATIME_HOME="${HOME}/.wakatime"

    [ ! -d "${WAKATIME_HOME}" ] &&
        mkdir -p "${WAKATIME_HOME}"
fi
