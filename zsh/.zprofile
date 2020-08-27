#!/usr/bin/env zsh

if [ -f "${HOME}"/.profile ]
then
    emulate sh -c ". ${HOME}/.profile"
fi
