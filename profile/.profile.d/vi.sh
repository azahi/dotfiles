#!/bin/sh

for i in nvim vim vi
do
    # shellcheck disable=SC2139
    command -v "$i" >/dev/null 2>&1 && \
        alias vim="$i" && \
        [ "$i" = "nvim" ] && export NVIM_TUI_ENABLE_TRUE_COLOR=1 && \
        break
done
