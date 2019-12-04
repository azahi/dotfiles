#!/usr/bin/env zsh

setopt auto_cd
setopt auto_name_dirs
setopt auto_pushd
setopt auto_resume
setopt cdable_vars
setopt clobber
setopt combining_chars
setopt hash_list_all
setopt ignore_eof
setopt long_list_jobs
setopt magic_equal_subst
setopt no_auto_name_dirs
setopt no_beep
setopt no_bg_nice
setopt no_check_jobs
setopt no_correct_all
setopt no_glob_dots
setopt no_hup
setopt no_mail_warning
setopt notify
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
setopt rc_quotes

# History {{{
export HISTFILE="${HISTFILE}_zsh"
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

zstyle ':completion:*' verbose yes

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path   "${XDG_CACHE_HOME-$HOME}/.zcompcache"
zstyle ':completion:*' use-cache    on

zstyle ':complation:*' matcher-list '' \
    'm:{a-z\-}={A-Z\_}' \
    'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
    'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*:options' description      yes
zstyle ':completion:*:options' auto-description '%d'

zstyle ':completion:*:matches' group yes

zstyle ':completion:*'              format '%d'
zstyle ':completion:*:corrections'  format '%F{green}%d (errors: %e)%f'
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*:messages'     format '%F{purple}%d%f'
zstyle ':completion:*:warnings'     format '%F{red}no matches found%f'

zstyle ':completion:*'               completer  _complete _list _match _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:match:*'       original   only

zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

zstyle ':completion:*'                        special-dirs    true
zstyle ':completion:*'                        squeeze-slashes true
zstyle ':completion:*:*:cd:*'                 ignore-parents  parent pwd
zstyle ':completion:*:*:cd:*'                 tag-order       local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu            yes select
zstyle ':completion:*:-tilde-:*'              group-order     'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*:default'                list-colors     ${(s.:.)LS_COLORS}

zstyle ':completion:*:history-words' list            false
zstyle ':completion:*:history-words' menu            yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop            yes

zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

zstyle ':completion:*:rm:*' file-patterns '*:all-files'
zstyle ':completion:*:rm:*' ignore-line   other

zstyle ':completion:*:*:kill:*'           force-list always
zstyle ':completion:*:*:kill:*'           insert-ids single
zstyle ':completion:*:*:kill:*'           menu yes select
zstyle ':completion:*:*:kill:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'

zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections   true

zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:(scp|rsync):*' tag-order   'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(ssh|mosh):*'  group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|mosh):*'  tag-order   'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'

zstyle ':completion:*:(ssh|mosh|scp|rsync):*:hosts-domain' ignored-patterns \
    '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|mosh|scp|rsync):*:hosts-host'   ignored-patterns \
    '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|mosh|scp|rsync):*:hosts-ipaddr' ignored-patterns \
    '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'
# }}}

# Plugins {{{
if [ ! -d "$HOME/.zplug" ]
then
    git clone "https://github.com/zplug/zplug" "$HOME/.zplug"
    source "$HOME/.zplug/init.zsh" && \
        zplug update --self
fi
source "$HOME/.zplug/init.zsh"


zplug "zsh-users/zsh-autosuggestions", if:"[[ $TERM != linux ]]" # {{{
bindkey '^ ' autosuggest-accept
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
bindkey '^p' up-history
bindkey '^n' down-history

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

bindkey '^[[Z' reverse-menu-complete
# }}}
