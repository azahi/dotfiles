#!/bin/sh

alias cp="cp -v -i"
alias ln="ln -v -i"
alias mv="mv -v -i"
if [ "$(uname -s)" = "Linux" ]
then
    alias rm="rm -v -I"
else
    alias rm="rm -v -i"
fi

alias mkdir="mkdir -v -p"
alias rmdir="rmdir -v -p"

alias grep="grep --color=auto"
alias egrep="grep --color=auto"
alias fgrep="grep --color=auto"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
