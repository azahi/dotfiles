#!/usr/bin/env bash

if [ -f "${HOME}/.bin/logout-hook" ]; then
    # shellcheck disable=SC1091
    source "${HOME}/.bin/logout-hook"
fi
