#!/bin/sh

if [ -d /usr/lib/llvm ]
then
    for VERSION in /usr/lib/llvm/*
    do
        path_append "${VERSION}/bin"
    done
fi
