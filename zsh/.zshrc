#!/usr/bin/env zsh

#zmodload zsh/zprof

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
setopt COMBINING_CHARS
setopt COMPLETE_IN_WORD
setopt HASH_LIST_ALL
setopt IGNORE_EOF
setopt INTERACTIVE_COMMENTS
setopt LIST_PACKED
setopt LONG_LIST_JOBS
setopt MAGIC_EQUAL_SUBST
setopt NO_ALWAYS_TO_END
setopt NO_BEEP
setopt NO_BG_NICE
setopt NO_CHECK_JOBS
setopt NO_CORRECT_ALL
setopt NO_GLOB_COMPLETE
setopt NO_GLOB_DOTS
setopt NOTIFY
setopt PROMPT_SUBST
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt RC_QUOTES

# History {{{
[ "${HISTFILE: -4}" != "_zsh" ] && export HISTFILE="${HISTFILE}_zsh"
export SAVEHIST="${HISTSIZE}"

setopt APPEND_HISTORY
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_BEEP
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
if [[ -s ${ZCOMPDUMP}(#qN.mh+24) && ( ! -s "${ZCOMPDUMP}.zwc" || "${ZCOMPDUMP}" -nt "${ZCOMPDUMP}.zwc" ) ]]
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
setopt FLOW_CONTROL
setopt NO_ALWAYS_TO_END
setopt NO_CASE_GLOB
setopt NO_COMPLETE_ALIASES
setopt NO_MENU_COMPLETE
setopt PATH_DIRS

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
if [ ! -d "${HOME}/.zplug" ]
then
    git clone "https://github.com/zplug/zplug" "${HOME}/.zplug"
fi
source "${HOME}/.zplug/init.zsh"


# {{{
MODE_INDICATOR=""
VIM_MODE_TRACK_KEYMAP=no

zplug "softmoth/zsh-vim-mode"

bindkey -rpM viins '^[^[' # https://github.com/softmoth/zsh-vim-mode#removing-bindings
# }}}


# {{{

zplug "hlissner/zsh-autopair", defer:3, if:"[[ ${TERM} != linux ]]"

# }}}


# {{{

zplug "zsh-users/zsh-autosuggestions", if:"[[ ${TERM} != linux ]]"

bindkey '^ ' autosuggest-accept # C-SPC
# }}}


# {{{

zplug "zsh-users/zsh-syntax-highlighting", defer:2, if:"[[ ${TERM} != linux ]]"

# }}}


# {{{

zplug "zsh-users/zsh-completions"

# }}}


# {{{

zplug "gentoo/gentoo-zsh-completions", if:"[[ $(zgrep Gentoo /proc/config.gz) ]]"

fpath+="${ZPLUG_REPOS}/gentoo/gentoo-zsh-completions/src"
# }}}


# {{{

zplug "ninrod/pass-zsh-completion", if:"[[ $(command -v pass) ]]"

# }}}


# {{{

zplug "plugins/colored-man-pages", from:oh-my-zsh, if:"[[ $(command -v man) ]]"

# }}}


# {{{

zplug "plugins/ansible", from:oh-my-zsh, if:"[[ $(command -v ansible) ]]"

# }}}


# {{{

zplug "plugins/fzf", from:oh-my-zsh, if:"[[ $(command -v fzf) ]]"

# }}}


# {{{

zplug "plugins/autojump", from:oh-my-zsh, if:"[[ $(command -v autojump) ]]"

# }}}


# {{{

zplug "plugins/brew", from:oh-my-zsh, if:"[[ $(command -v brew) ]]"

# }}}


# {{{

zplug "plugins/rust", from:oh-my-zsh, if:"[[ $(command -v rustc) ]]"

# }}}


# {{{

zplug "azahi/zsh-lambda", as:theme, if:"[[ ${TERM} != linux ]]"

# }}}


zplug check || zplug install
zplug load
# }}}

# https://github.com/direnv/direnv {{{
[[ $(command -v direnv) ]] \
    && eval "$(direnv hook zsh)"
# }}}

# https://github.com/garabik/grc {{{
[[ -s "/usr/share/grc/grc.zsh" ]] && \
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

#zprof
