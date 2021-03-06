#!/usr/bin/env zsh

[ "${HISTFILE: -4}" != "_zsh" ] && export HISTFILE="${HISTFILE}_zsh"
export SAVEHIST="${HISTSIZE}"

setopt APPEND_HISTORY
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
unsetopt HIST_BEEP

export HISTIGNORE="ls:cd:cd -:pwd:exit:date:cal:* --help"
