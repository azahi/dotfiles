#!/bin/sh
# shellcheck disable=SC2139

if command -v bear >/dev/null 2>&1; then
    _implementations="
        remake
        make
    "

    for _implementation in ${_implementations}; do
        if command -v "${_implementation}" >/dev/null 2>&1; then
            _bear_base="bear --include=./include --include=../include"
            if command -v nproc >/dev/null 2>&1; then
                alias m="${_bear_base} ${_implementation} --jobs=$(($(nproc) + 1))"
            else
                alias m="${_bear_base} ${_implementation}"
            fi
            alias mc="m clean"

            unset _bear_base _implementation
            break
        fi
    done
    unset _implementations
fi
