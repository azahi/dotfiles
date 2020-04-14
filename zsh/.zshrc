#!/usr/bin/env zsh

#zmodload zsh/zprof

setopt auto_cd
setopt auto_menu
setopt auto_name_dirs
setopt auto_pushd
setopt auto_resume
setopt c_bases
setopt cdable_vars
setopt clobber
setopt combining_chars
setopt complete_in_word
setopt hash_list_all
setopt ignore_eof
setopt interactive_comments
setopt list_packed
setopt long_list_jobs
setopt magic_equal_subst
setopt no_always_to_end
setopt no_auto_name_dirs
setopt no_beep
setopt no_bg_nice
setopt no_check_jobs
setopt no_correct_all
setopt no_glob_complete
setopt no_glob_dots
setopt no_hup
setopt no_mail_warning
setopt no_prompt_cr
setopt notify
setopt notify
setopt octal_zeroes
setopt prompt_subst
setopt promptsubst
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
setopt rc_quotes

# History {{{
[ "${HISTFILE: -4}" != "_zsh" ] && export HISTFILE="${HISTFILE}_zsh"
export SAVEHIST="$HISTSIZE"

setopt append_history
setopt bang_hist
setopt extended_history
setopt hist_beep
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt share_history
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

setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt complete_in_word
setopt flow_control
setopt no_always_to_end
setopt no_case_glob
setopt no_complete_aliases
setopt no_menu_complete
setopt path_dirs

zstyle ':complation:*' matcher-list      'm:{a-z}={A-Z}'
zstyle ':completion:*' accept-exact      '*(N)'
zstyle ':completion:*' cache-path        "${XDG_CACHE_HOME:-$HOME}/.zcompcache"
zstyle ':completion:*' insert-sections   true
zstyle ':completion:*' list-colors       "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-dirs-first   true
zstyle ':completion:*' menu              select
zstyle ':completion:*' separate-sections true
zstyle ':completion:*' use-cache         true
zstyle ':completion:*' verbose           true

zstyle ':completion:*'              format '%F{blue}%d%f'
zstyle ':completion:*:corrections'  format '%F{yellow}%d (errors: %e)%f'
zstyle ':completion:*:descriptions' format '%F{green}%d%f'
zstyle ':completion:*:messages'     format '%F{purple}%d%f'
zstyle ':completion:*:warnings'     format '%F{red}no matches found%f'

zstyle ':completion:*:matches' group true

zstyle ':completion:*:*:kill:*'           force-list always
zstyle ':completion:*:*:kill:*:processes' command 'ps -u $LOGNAME -o pid,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
# }}}

# Plugins {{{
if [ ! -d "$HOME/.zplug" ]
then
    git clone "https://github.com/zplug/zplug" "$HOME/.zplug"
fi
source "$HOME/.zplug/init.zsh"


zplug "zsh-users/zsh-autosuggestions", if:"[[ $TERM != linux ]]" # {{{
bindkey '^ ' autosuggest-accept # C-SPC
# }}}

zplug "rbirnie/oh-my-zsh-keybase", if:"[[ $(command -v keybase) ]]" # {{{
# }}}

zplug "ninrod/pass-zsh-completion", if:"[[ $(command -v pass) ]]" # {{{
# }}}

zplug "srijanshetty/zsh-pandoc-completion", if:"[[ $(command -v pandoc) ]]" # {{{
# }}}

zplug "srijanshetty/zsh-pip-completion", if:"[[ $(command -v pip) ]]" # {{{
# }}}

zplug "racket/shell-completion", if:"[[ $(command -v racket) ]]" # {{{
# }}}

zplug "zsh-users/zsh-completions" # {{{
# }}}

zplug "zsh-users/zsh-syntax-highlighting", defer:2, if:"[[ $TERM != linux ]]" # {{{
# }}}

zplug "zsh-users/zsh-history-substring-search", if:"[[ $TERM != linux ]]" # {{{
# }}}

zplug "hlissner/zsh-autopair", defer:2, if:"[[ $TERM != linux ]]" # {{{
# }}}

zplug "wyntau/fzf-zsh", if:"[[ $(command -v fzf) ]]" # {{{
# }}}

zplug "plugins/vi-mode", from:oh-my-zsh # {{{
KEYTIMEOUT=1
MODE_INDICATOR="\0"
# }}}

zplug "azahi/zsh-lambda", as:theme, if:"[[ $TERM != linux ]]" # {{{
# }}}


zplug check || zplug install
zplug load
# }}}

# Keybindings {{{
bindkey '^P'    up-history              # C-p
bindkey '^N'    down-history            # C-n

bindkey '^A'    beginning-of-line       # C-a
bindkey '^E'    end-of-line             # C-e

bindkey '^H'    backward-delete-char    # C-h

bindkey '^J'    accept-line             # C-m

bindkey '^[[Z'  reverse-menu-complete   # M-TAB

# }}}

#zprof
