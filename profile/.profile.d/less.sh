#!/bin/sh

if command -v less >/dev/null 2>&1
then
    export LESS="-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]"
    export LESSCHARSET='utf-8'
    export LESSHISTFILE="-"
fi
