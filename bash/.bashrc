#!/usr/bin/env bash

for i in "${HOME}"/.bash.d/*.bash; do
    # shellcheck disable=SC1090
    [[ -r "${i}" ]] && source "${i}"
done
