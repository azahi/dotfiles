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
HISTFILESIZE=$HISTSIZE
HISTIGNORE=ls:ll:la

complete -A directory cd

export PS1="\[\033[0;32m\]\w\[\033[0m\] \[\033[0;33m\]$\[\033[0m\] "

if command -v brew &> /dev/null 2>&1 && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]
then
    BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
    export BASH_COMPLETION_COMPAT_DIR
    # shellcheck source=/dev/null
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
elif [ -f /etc/bash_completion ]
then
    # shellcheck disable=SC1091
	source /etc/bash_completion
elif [ -d /etc/bash_completion.d ]
then
    for i in /etc/bash_completion.d/*
    do
        # shellcheck disable=SC1090
        [ -f "$i" ] && source "$i"
    done
fi
