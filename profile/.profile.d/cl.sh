#!/bin/sh

for i in sbcl ccl clisp abcl
do
    # shellcheck disable=SC2139
    if command -v "$i" >/dev/null 2>&1
    then
        if command -v "$i" >/dev/null 2>&1
        then
            alias cl="rlwrap $i"
        else
            alias cl="$i"
        fi
        break
    fi
done
