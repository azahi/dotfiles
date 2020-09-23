#!/bin/sh

if [ -z "${LANG}" ]
then
    export LANG="en_US.utf8"
fi
export LC_COLLATE=C
