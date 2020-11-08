#!/bin/bash

if [ -f "${HOME}"/.profile ]
then
    source ${HOME}/.profile
fi

if [ -f "${HOME}/.bashrc" ]
then
    source ${HOME}/.bashrc
fi
