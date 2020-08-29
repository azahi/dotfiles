#!/usr/bin/env zsh

if [ ${TERM} != "linux" ]
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
        true && \
            zgen load azahi/zsh-lambda \
            lambda.zsh-theme

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
    bindkey '^ ' autosuggest-accept
fi

fpath()
{
    echo "$fpath" | tr ' ' '\n'
}
