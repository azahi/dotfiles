#!/bin/bash

setopt auto_cd
setopt auto_name_dirs
setopt auto_pushd
setopt cdable_vars
setopt clobber
setopt no_case_glob
setopt prompt_subst
setopt pushd_silent
setopt pushd_to_home

disable r

# History {{{
export SAVEHIST="$HISTSIZE"
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_by_copy
setopt hist_save_no_dups
# }}}

# Completion {{{
autoload -Uz compinit
if [[ -s $ZCOMPDUMP(#qN.mh+24) && ( ! -s "$ZCOMPDUMP.zwc" || "$ZCOMPDUMP" -nt "$ZCOMPDUMP.zwc" ) ]]
then
    compinit -d "$ZCOMPDUMP"
    zrecompile -pq "$ZCOMPDUMP"
else
    compinit -d "$ZCOMPDUMP" -C
fi

zstyle ':completion:*' format '%d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' separate-sectoins true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-cache true
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:functions' ignored-patterns '_*'

setopt magic_equal_subst
# }}}

# Plugins {{{
if [ ! -d "$HOME/.zplug" ]
then
    git clone "https://github.com/zplug/zplug" "$HOME/.zplug"
    # shellcheck disable=SC1090
    source "$HOME/.zplug/init.zsh" && \
        zplug update --self
fi
# shellcheck disable=SC1090
source "$HOME/.zplug/init.zsh"


zplug "zsh-users/zsh-autosuggestions", if:"[[ $TERM != linux ]]" # {{{
# }}}

zplug "ninrod/pass-zsh-completion", if:"$(command -v pass >/dev/null 2>&1)" # {{{
# }}}

zplug "zsh-users/zsh-completions" # {{{
# }}}

zplug "zsh-users/zsh-syntax-highlighting", defer:2, if:"[[ $TERM != linux ]]" # {{{
# }}}

zplug "zsh-users/zsh-history-substring-search", if:"[[ $TERM != linux ]]" # {{{
# }}}

zplug "hlissner/zsh-autopair", defer:2, if:"[[ $TERM != linux ]]" # {{{
# }}}

export MODE_INDICATOR="\0"
zplug "plugins/vi-mode", from:oh-my-zsh # {{{
bindkey '^ ' autosuggest-accept
# }}}

zplug "azahi/zsh-lambda", as:theme, if:"[[ $TERM != linux ]]" # {{{
# }}}


zplug check || zplug install
zplug load
# }}}

# Keybindings {{{
bindkey '^p' up-history
bindkey '^n' down-history

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

bindkey '^[[Z' reverse-menu-complete
# }}}
