#!/usr/bin/env zsh

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
