#!/bin/sh

if command -v df >/dev/null 2>&1; then
    alias disk="df --human-readable --exclude-type=tmpfs --exclude-type=devtmpfs"
fi
