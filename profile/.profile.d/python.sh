#!/bin/sh

for i in python python3 python2
do
    if command -v "$i" > /dev/null 2>&1
    then
        [ -f "${HOME}/.pystartup" ] && \
            export PYTHONSTARTUP="${HOME}/.pystartup"

        if [ "$(uname)" = "Darwin" ]
        then
            for j in "${HOME}/Library/Python/"*
            do
                path_prepend "$j/bin"
            done
        fi

        alias pipup="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

        break
    fi
done
