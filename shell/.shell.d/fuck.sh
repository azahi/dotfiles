#!/bin/sh

if ! command -v fuck > /dev/null 2>&1
then
    alias fuck="sudo \$(fc -ln -1)"
fi
