#!/bin/sh

if command -v cargo >/dev/null 2>&1
then
    path_prepend "$HOME/.cargo/bin"

    export CARGO_HOME="$HOME/.cargo"
    export CARGO_CACHE_RUSTC_INFO=0
fi
