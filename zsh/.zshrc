#!/usr/bin/env zsh

bindkey -v

[ ! -d "$XDG_DATA_HOME/zsh" ] && \
    mkdir -p "$XDG_DATA_HOME/zsh"

setopt    autocd
setopt    extended_glob
setopt    no_case_glob
setopt    prompt_subst
setopt no_clobber
setopt no_correct
setopt no_correct_all

HISTFILE="$XDG_DATA_HOME/zsh/histfile"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY

autoload -Uz compinit
compinit -d "$XDG_DATA_HOME/zsh/zcompdump"

zstyle ':completion:*' format '%d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' menu select
zstyle ':completion:*' separate-sectoins true
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:functions' ignored-patterns '_*'

source $HOME/.zplug/init.zsh

zplug "Tarrasch/zsh-functional"
zplug "ael-code/zsh-colored-man-pages"
zplug "chrissicool/zsh-256color"
zplug "hlissner/zsh-autopair", defer:1
zplug "softmoth/zsh-vim-mode"
zplug "wting/autojump", if:"[ $(command -v autojump) ]"
zplug "zpm-zsh/colors"
zplug "zpm-zsh/ls", defer:2
zplug "zsh-users/zsh-autosuggestions"
bindkey '^ ' autosuggest-accept

if ! zplug check
then
    printf "Install? [y/N]: "
    if read -q
    then
        echo
        zplug install
    fi
fi

zplug load
