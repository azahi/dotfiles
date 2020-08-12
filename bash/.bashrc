#!/bin/bash

[[ $- != *i* ]] && \
    return

stty -ixon

set -o vi

set -b +H

shopt -s checkjobs
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s hostcomplete
shopt -s nocaseglob

shopt -s autocd 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null

set +o histexpand
shopt -s cmdhist
shopt -s histappend
shopt -s histreedit
HISTCONTROL=erasedups:ignorespace
[ "${HISTFILE: -5}" != "_bash" ] && HISTFILE="${HISTFILE}_bash"
HISTFILESIZE=$HISTSIZE
HISTTIMEFORMAT='%F %T '

complete -A directory cd

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set mark-symlinked-directories on"
bind "set show-all-if-ambiguous on"

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
PROMPT_DIRTRIM=2

PS1="\[\033[0;32m\]\w\[\033[0m\] \[\033[1;32m\]λ\[\033[0m\] "
