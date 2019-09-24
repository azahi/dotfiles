#!/usr/bin/env zsh

bindkey -v

setopt autocd
setopt extended_glob
setopt no_case_glob
setopt prompt_subst

SAVEHIST=$HISTSIZE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_BY_COPY

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zcompdump"

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
zplug "zsh-users/zsh-autosuggestions"
bindkey '^ ' autosuggest-accept
zplug "win0err/aphrodite-terminal-theme", as:theme
zplug "zsh-users/zsh-completions"
zplug "ninrod/pass-zsh-completion"

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
