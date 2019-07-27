#!/usr/bin/env zsh

for f in $HOME/.zsh/[0-9]*.zsh
do
    source $f
done
