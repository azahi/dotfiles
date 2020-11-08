#!/bin/bash

set -o notify

shopt -s extglob
shopt -s globstar

shopt -s autocd 2>/dev/null
shopt -s dirspell 2>/dev/null
shopt -s cdspell 2>/dev/null

shopt -s histappend
shopt -s histreedit
shopt -s histverify
[[ "${HISTFILE}" =~ (_bash)+$ ]] && HISTFILE="${HISTFILE}_bash"
HISTCONTROL=erasedups:ignorespace
HISTFILESIZE=$HISTSIZE
HISTTIMEFORMAT="[%F %T] "

complete -A directory cd

PS1="\[\033[0;32m\]\w\[\033[0m\] \[\033[0;33m\]λ\[\033[0m\] "
