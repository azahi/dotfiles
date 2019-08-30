#!/bin/bash

[[ $- != *i* ]] && \
    return

set -o vi

shopt -s autocd 2>/dev/null
shopt -s checkjobs 2>/dev/null
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s hostcomplete

set +o histexpand
shopt -s cmdhist
shopt -s histappend
shopt -s histreedit
HISTCONTROL=ignoredups:ignorespace
HISTFILESIZE=$HISTSIZE

complete -A directory cd

export PS1="\[\033[0;32m\]\w\[\033[0m\] \[\033[0;33m\]$\[\033[0m\] "
