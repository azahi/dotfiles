#!/usr/bin/env zsh

path-prepend "$HOME/.cargo/bin"
path-prepend "$HOME/.go/bin"
path-prepend "$HOME/.cabal/bin"
path-prepend "$HOME/.local/bin"
path-prepend "$HOME/.bin"

path-append "/usr/lib/plan9/bin"
path-append "/usr/local/bin"
path-append "/usr/bin"
path-append "/bin"
path-append "/usr/local/sbin"
path-append "/usr/sbin"
path-append "/sbin"
