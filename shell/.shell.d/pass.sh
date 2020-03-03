#!/bin/sh

if command -v pass > /dev/null 2>&1
then
    export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
fi
