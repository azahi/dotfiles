#!/bin/sh

if command -v doas >/dev/null 2>&1; then
    alias sudo="doas"
fi
