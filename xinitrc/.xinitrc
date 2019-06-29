#!/usr/bin/env bash

[[ -f "${HOME}/.Xresources" ]] && \
    xrdb "${HOME}/.Xresources"

xset b off

xset mouse 0 0

xset r rate 200 50

xset dpms force on
xset s default

xset fp rehash

urxvtd -q -o -f

setxkbmap -layout "us, ru" -option "grp:win_space_toggle" -option "compose:menu"

[[ -f "${HOME}/.xmodmaprc" ]] && \
    xmodmap "${HOME}/.xmodmaprc"

xsetroot -cursor_name left_ptr

#hsetroot -center "${HOME}/pictures/wallpapers/mill.png"
hsetroot -cover "${HOME}/pictures/wallpapers/danish_soldiers_return_to_copenhagen.jpg"

unclutter --fork --ignore-scrolling

autocutsel -fork
autocutsel -fork -selection PRIMARY

export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"

fcitx -r -d -s 0 &

compton -b

#oneko -neko -tofocus -speed 25 -bg "#a19782" -fg "#0b0806" &

exec xmonad
