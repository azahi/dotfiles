#!/usr/bin/env zsh

bindkey '^P'    up-history              # C-p
bindkey '^N'    down-history            # C-n

bindkey '^A'    beginning-of-line       # C-a
bindkey '^E'    end-of-line             # C-e

bindkey '^H'    backward-delete-char    # C-h

bindkey '^J'    accept-line             # C-m

bindkey '^[[Z'  reverse-menu-complete   # M-TAB
