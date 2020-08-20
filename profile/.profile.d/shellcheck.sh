#!/bin/sh

if command -v shellcheck >/dev/null 2>&1 && ! command -v sc >/dev/null 2>&1
then
    alias sc="shellcheck"
fi
