#!/bin/sh

if command -v ranger > /dev/null 2>&1 && [ -d "$XDG_CONFIG_HOME/ranger" ]
then
    export RANGER_LOAD_DEFAULT_RC="false"
fi
