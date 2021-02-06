#!/bin/sh

if command -v cargo >/dev/null 2>&1; then
    export CARGO_HOME="${HOME}/.cargo"
    export CARGO_CACHE_RUSTC_INFO="0"

    path_append "${CARGO_HOME}/bin"
fi
