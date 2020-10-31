#!/bin/sh

if cp --help | grep "progress-bar" >/dev/null 2>&1
then
    alias cp="cp -g"
fi

if mv --help | grep "progress-bar" >/dev/null 2>&1
then
    alias mv="mv -g"
fi
