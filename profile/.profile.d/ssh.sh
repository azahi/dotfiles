#!/bin/sh

if command -v ssh >/dev/null 2>&1
then
    alias s="TERM=xterm ssh"
fi
