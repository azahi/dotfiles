#!/bin/sh

if command -v wget >/dev/null 2>&1 \
&& [ "$(hostname)" != "sava" ]
then
    # shellcheck disable=SC2139
    alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"
fi
