#!/bin/sh

if command -v fzf >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND=""
    export FZF_DEFAULT_OPTS="--height 20% --reverse --border"
fi
