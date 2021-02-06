#!/bin/sh

if command -v free >/dev/null 2>&1; then
    alias ram="free --human --wide"
fi
