#!/usr/bin/env zsh

if [ "${TERM}" != "linux" ]
then
    ZGEN_DIR="${HOME}/.zsh.d/zgen"

    if [ ! -d "${ZGEN_DIR}" ]
    then
        git clone "https://github.com/tarjoilija/zgen" "${ZGEN_DIR}"
    fi

    # softmoth/zsh-vim-mode
    MODE_INDICATOR=""
    VIM_MODE_TRACK_KEYMAP=no

    source "${ZGEN_DIR}/zgen.zsh"
    if ! zgen saved
    then
        zgen load hlissner/zsh-autopair

        zgen load zsh-users/zsh-autosuggestions

        zgen load zsh-users/zsh-history-substring-search

        zgen load zsh-users/zsh-syntax-highlighting

        zgen load zsh-users/zsh-completions

        zgen load softmoth/zsh-vim-mode

        zgen save
    fi

    # zsh-users/zsh-autosuggestions
    bindkey '^ ' autosuggest-accept

    # softmoth/zsh-vim-mode
    bindkey -rpM viins '^[^['
fi
