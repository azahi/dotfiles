#!/usr/bin/env zsh

bindkey -v

setopt autocd
setopt extended_glob
setopt no_case_glob
setopt prompt_subst

SAVEHIST=$HISTSIZE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_BY_COPY

autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zcompdump"

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

if [ ! -d ~/.zplug ]
then
    git clone https://github.com/zplug/zplug $HOME/.zplug
    source $HOME/.zplug/init.zsh && zplug update --self
fi
source $HOME/.zplug/init.zsh

zplug "ael-code/zsh-colored-man-pages"
zplug "azahi/zsh-lambda", as:theme
zplug "chrissicool/zsh-256color"
zplug "hlissner/zsh-autopair", defer:1
zplug "ninrod/pass-zsh-completion"
zplug "softmoth/zsh-vim-mode"
zplug "zsh-users/zsh-autosuggestions"
bindkey '^ ' autosuggest-accept
zplug "zsh-users/zsh-completions"

if ! zplug check
then
    zplug install
fi

zplug load
