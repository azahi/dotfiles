#!/usr/bin/env zsh

bindkey -v

setopt autocd
setopt extended_glob
setopt no_case_glob
setopt prompt_subst

# History {{{
SAVEHIST=$HISTSIZE
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_by_copy
# }}}

# Completion {{{
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zcompdump"

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
if [ ! -d ~/.zplug ]
then
    git clone https://github.com/zplug/zplug $HOME/.zplug
    source $HOME/.zplug/init.zsh && \
        zplug update --self
fi
source $HOME/.zplug/init.zsh


zplug "zsh-users/zsh-autosuggestions"

zplug "ninrod/pass-zsh-completion", if:"[[ command -v pass ]]"
zplug "zsh-users/zsh-completions"

zplug "junegunn/fzf", if:"[[ command -v fzf ]]", use:"shell/key-bindings.zsh"
zplug "junegunn/fzf", if:"[[ command -v fzf ]]", use:"shell/completion.zsh"

zplug "djui/alias-tips"

zplug "hlissner/zsh-autopair", defer:2

zplug "softmoth/zsh-vim-mode"
bindkey '^ ' autosuggest-accept

zplug "chrissicool/zsh-256color"

zplug "ael-code/zsh-colored-man-pages"

zplug "azahi/zsh-lambda", as:theme, if:"[[ $TERM != linux ]]"

zplug check || zplug install
zplug load
# }}}

# Keybindings {{{
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
# }}}
