#!/usr/bin/env zsh

precmd ()
{
    PROMPT="%{$fg[green]%}%~%{$reset_color%} %{$fg_bold[green]%}λ%{$reset_color%} "
}
