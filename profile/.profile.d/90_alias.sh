#!/bin/sh

if cp --help | grep -q "\--progress-bar"; then
	alias cp="cp -i -r -g"
else
	alias cp="cp -i -r"
fi

if mv --help | grep -q "\--progress-bar"; then
	alias mv="mv -i -g"
else
	alias mv="mv -i"
fi

if rm --help | grep -q "\--interactive\[=WHEN\]"; then
	alias rm="rm -I"
else
	alias rm="rm -i"
fi

alias c="cd"

alias ln="ln -i"

alias mkdir="mkdir -p"
alias rmdir="rmdir -p"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias du="du -h"

alias df="df -h"
