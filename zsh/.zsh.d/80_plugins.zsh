#!/usr/bin/env zsh

if [ "${TERM}" != "linux" ]
then
    ZGENOM_DIR="${HOME}/.zsh.d/zgenom"

    if [ ! -d "${ZGENOM_DIR}" ]
    then
        git clone "https://github.com/jandamm/zgenom.git" "${ZGENOM_DIR}"
    fi

    source "${ZGENOM_DIR}/zgenom.zsh"
    if ! zgen saved
    then
        zgenom load hlissner/zsh-autopair

        zgenom load zsh-users/zsh-autosuggestions

        zgenom load zsh-users/zsh-history-substring-search

        zgenom load zsh-users/zsh-syntax-highlighting

        zgenom load zsh-users/zsh-completions

        #zgenom load softmoth/zsh-vim-mode
        zgenom load jeffreytse/zsh-vi-mode

        zgenom save
    fi

    # zsh-users/zsh-autosuggestions
    bindkey '^ ' autosuggest-accept
fi
