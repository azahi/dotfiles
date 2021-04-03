#!/bin/sh

if command -v go >/dev/null 2>&1; then
    export GO111MODULE="on"
    export GOPATH="${HOME}/.go"

    path_append "${GOPATH}/bin"
fi
