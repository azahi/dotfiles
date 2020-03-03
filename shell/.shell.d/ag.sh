#!/bin/sh

if command -v ag > /dev/null 2>&1
then
    alias ag="ag --color"
fi
