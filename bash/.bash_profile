#!/usr/bin/env bash

if [ -f "${HOME}"/.profile ]; then
    # shellcheck disable=SC1091
    source "${HOME}/.profile"
fi

if [ -f "${HOME}/.bashrc" ]; then
    # shellcheck disable=SC1091
    source "${HOME}/.bashrc"
fi
