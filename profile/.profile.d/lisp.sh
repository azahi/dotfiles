#!/bin/sh

for i in sbcl ccl clisp abcl; do
    # shellcheck disable=SC2139
    if command -v "$i" >/dev/null 2>&1; then
        if command -v "$i" >/dev/null 2>&1; then
            alias lisp="rlwrap $i"
        else
            alias lisp="$i"
        fi
        break
    fi
done
