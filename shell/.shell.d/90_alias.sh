#!/bin/sh

alias cp="cp -i"
alias ln="ln -i"
alias mv="mv -i"
if [ "$(uname -s)" = "Linux" ]
then
    alias rm="rm -I"
fi

alias mkdir="mkdir -p"
alias rmdir="rmdir -p"

alias grep="grep --color=auto"
