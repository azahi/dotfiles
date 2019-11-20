#!/usr/bin/env zsh

if [ -f $HOME/.profile ]
then
    emulate sh -c ". $HOME/.profile"
fi

if [ -x /usr/libexec/path_helper ]
then
    eval $(/usr/libexec/path_helper -s)
fi
