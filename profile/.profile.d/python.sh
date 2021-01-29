#!/bin/sh

for i in python python3 python2
do
    if command -v "${i}" >/dev/null 2>&1
    then
        [ -f "${HOME}/.pystartup" ] && \
            export PYTHONSTARTUP="${HOME}/.pystartup"

        for j in pip pip3 pip2
        do
            if command -v "${j}" >/dev/null 2>&1
            then
                # shellcheck disable=SC2139
                alias pip-update="${j} list --user --outdated --format=freeze | grep -v '^\-e' | cut -d= -f1 | xargs -n1 ${j} install --user -U"

                break
            fi
        done

        break
    fi
done
