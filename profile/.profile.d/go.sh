#!/bin/sh

if command -v go >/dev/null 2>&1
then
    export GOPATH="${HOME}/.go"

    path_prepend "${HOME}/.go/bin"
fi
