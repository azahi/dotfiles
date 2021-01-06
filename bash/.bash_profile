#!/bin/bash

if [ -f "${HOME}"/.profile ]
then
    # shellcheck disable=SC1090
    source "${HOME}/.profile"
fi

if [ -f "${HOME}/.bashrc" ]
then
    # shellcheck disable=SC1090
    source "${HOME}/.bashrc"
fi
