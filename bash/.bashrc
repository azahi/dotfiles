#!/bin/bash

[[ $- != *i* ]] && \
    return

stty -ixon

set -o vi

set -b +H

shopt -s autocd
shopt -s checkjobs
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s hostcomplete
shopt -s nocaseglob

set +o histexpand
shopt -s cmdhist
shopt -s histappend
shopt -s histreedit
HISTCONTROL=erasedups:ignorespace
[ "${HISTFILE: -5}" != "_bash" ] && HISTFILE="${HISTFILE}_bash"
HISTFILESIZE=$HISTSIZE
HISTIGNORE=ls:ll:la

complete -A directory cd

export PS1="\[\033[0;32m\]\w\[\033[0m\] \[\033[0;33m\]$\[\033[0m\] "
