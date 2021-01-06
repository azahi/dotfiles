#!/usr/bin/env bash

shopt -s histappend
shopt -s histreedit
shopt -s histverify

[[ "${HISTFILE}" =~ (_bash)+$ ]] && HISTFILE="${HISTFILE}_bash"
HISTCONTROL=erasedups:ignorespace
HISTFILESIZE=$HISTSIZE
HISTTIMEFORMAT="[%F %T] "
