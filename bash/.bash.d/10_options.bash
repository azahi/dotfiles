#!/usr/bin/env bash

[[ $- == *i* ]] && stty -ixon

set -b +H

set -o notify

shopt -s extglob
shopt -s globstar

shopt -s autocd 2>/dev/null
shopt -s dirspell 2>/dev/null
shopt -s cdspell 2>/dev/null
