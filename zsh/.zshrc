#!/usr/bin/env zsh

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} ))
then
    function zle-line-init ()
    {
        echoti smkx
    }
    function zle-line-finish ()
    {
        echoti rmkx
    }

    zle -N zle-line-init
    zle -N zle-line-finish
fi

setopt CLOBBER
setopt GLOBDOTS
setopt INTERACTIVE_COMMENTS
setopt LONG_LIST_JOBS
setopt MAGIC_EQUAL_SUBST
setopt NOTIFY
setopt PROMPT_SUBST
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt RC_QUOTES
unsetopt BEEP
unsetopt BG_NICE
unsetopt CHECK_JOBS
unsetopt CORRECT_ALL

# History {{{
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
# }}}

# Completion {{{
autoload -Uz compinit
if [[ -s ${ZCOMPDUMP}(#qN.mh+12) && ( ! -s "${ZCOMPDUMP}.zwc" || "${ZCOMPDUMP}" -nt "${ZCOMPDUMP}.zwc" ) ]]
then
    compinit -d "${ZCOMPDUMP}"
    zrecompile -pq "${ZCOMPDUMP}"
else
    compinit -d "${ZCOMPDUMP}" -C
fi

setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt COMPLETE_IN_WORD
setopt EXTENDED_GLOB
setopt HASH_LIST_ALL
setopt LIST_PACKED
setopt PATH_DIRS
unsetopt CASE_GLOB
unsetopt FLOW_CONTROL
unsetopt MENU_COMPLETE

zstyle ':completion:*' use-cache                on
zstyle ':completion:*' cache-path               "${XDG_CACHE_HOME:-$HOME}/.zcompcache"

zstyle ':completion:*'                          format '%F{blue}%d%f'
zstyle ':completion:*:corrections'              format '%F{yellow}%d (errors: %e)%f'
zstyle ':completion:*:descriptions'             format '%F{green}%d%f'
zstyle ':completion:*:messages'                 format '%F{purple}%d%f'
zstyle ':completion:*:warnings'                 format '%F{red}no matches found%f'

zstyle ':completion:*:*:*:*:*'                  menu select
zstyle ':completion:*:matches'                  group 'yes'
zstyle ':completion:*:options'                  description 'yes'
zstyle ':completion:*:options'                  auto-description '%d'
zstyle ':completion:*:corrections'              format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions'             format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages'                 format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings'                 format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default'                  list-prompt '%S%M matches%s'
zstyle ':completion:*'                          format ' %F{yellow}-- %d --%f'
zstyle ':completion:*'                          group-name ''
zstyle ':completion:*'                          verbose yes
zstyle ':completion:*'                          matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*'                          squeeze-slashes true
zstyle ':completion:*'                          special-dirs true
zstyle ':completion:*:default'                  list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*'                   tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack'   menu yes select
zstyle ':completion:*:-tilde-:*'                group-order 'named-directories' 'path-directories' 'users' 'expand'

zstyle ':completion:*'                          completer _complete _match _approximate
zstyle ':completion:*:match:*'                  original only
zstyle ':completion:*:approximate:*'            max-errors 1 numeric

zstyle ':completion:*:functions'                ignored-patterns '(_*|pre(cmd|exec))'

zstyle ':completion:*:history-words'            stop yes
zstyle ':completion:*:history-words'            remove-all-dups yes
zstyle ':completion:*:history-words'            list false
zstyle ':completion:*:history-words'            menu yes

zstyle ':completion::*:(-command-|export):*'    fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

zstyle ':completion:*:(rm|kill|diff):*'         ignore-line other
zstyle ':completion:*:rm:*'                     file-patterns '*:all-files'

zstyle ':completion:*:*:*:*:processes'          command 'ps -u ${LOGNAME} -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes'       list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*'                 menu yes select
zstyle ':completion:*:*:kill:*'                 force-list always
zstyle ':completion:*:*:kill:*'                 insert-ids single

zstyle ':completion:*:manuals'                  separate-sections true
zstyle ':completion:*:manuals.(^1*)'            insert-sections true
# }}}

# https://github.com/direnv/direnv {{{
[[ $(command -v direnv) ]] \
    && eval "$(direnv hook zsh)"
# }}}

# https://github.com/wting/autojump {{{
[[ -s /usr/share/autojump/autojump.zsh ]] && \
    source /usr/share/autojump/autojump.zsh
# }}}

# https://github.com/garabik/grc {{{
[[ -s /usr/share/grc/grc.zsh ]] && \
    source /usr/share/grc/grc.zsh
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

# Plugins {{{
if [ ! -d "${HOME}/.zgen" ]
then
    git clone "https://github.com/tarjoilija/zgen" "${HOME}/.zgen"
fi

# softmoth/zsh-vim-mode
MODE_INDICATOR=""
VIM_MODE_TRACK_KEYMAP=no

# zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=64
ZSH_AUTOSUGGEST_USE_ASYNC=yes

# https://github.com/tarjoilija/zgen
ZGEN_AUTOLOAD_COMPINIT=0
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved
then
    true && \
        zgen load azahi/zsh-lambda \
        lambda.zsh-theme

    command -v pass >/dev/null 2>&1 && \
        zgen load ninrod/pass-zsh-completion \
        src

    zgrep Gentoo /proc/config.gz >/dev/null 2>&1 && \
        zgen load gentoo/gentoo-zsh-completions \
        src

    true && \
        zgen load zsh-users/zsh-completions

    true && \
        zgen load softmoth/zsh-vim-mode

    true && \
        zgen load hlissner/zsh-autopair

    true && \
        zgen load zsh-users/zsh-autosuggestions

    true && \
        zgen load zsh-users/zsh-syntax-highlighting

    zgen save
fi

# softmoth/zsh-vim-mode
bindkey -rpM viins '^[^['

# zsh-users/zsh-autosuggestions
bindkey '^ '    autosuggest-accept      # C-SPC
# }}}
