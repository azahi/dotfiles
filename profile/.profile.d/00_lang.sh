#!/bin/sh

if [ -z "${LANG}" ]
then
    export LANG="en_US.UTF-8"
fi

export LC_COLLATE=C
export LC_CTYPE=C
export LC_MESSAGES=C
