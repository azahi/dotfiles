#!/usr/bin/env zsh

source $HOME/.zplug/init.zsh


zplug "chrissicool/zsh-256color"


zplug "ael-code/zsh-colored-man-pages"


zplug "zpm-zsh/colors"


zplug "softmoth/zsh-vim-mode"


zplug "Tarrasch/zsh-functional"


zplug "wting/autojump", if:"[[ $(which autojump) ]]"


zplug "wfxr/forgit", defer:1, if:"[[ $(which fzf) ]]"


zplug "hlissner/zsh-autopair", defer:2


zplug "zdharma/fast-syntax-highlighting", defer:2


zplug "zpm-zsh/ls", defer:2


zplug "zsh-users/zsh-autosuggestions"
bindkey '^ ' autosuggest-accept


zplug "djui/alias-tips"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "


zplug "akz92/clean", as:theme


if ! zplug check
then
    printf "Install? [y/N]: "
    if read -q
    then
        echo
        zplug install
    fi
fi

zplug load
