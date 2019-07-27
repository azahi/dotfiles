#!/bin/sh

[ "$(command -v xrdb)" ] && [ -f "${HOME}/.Xresources" ] && \
    xrdb "${HOME}/.Xresources"

if [ "$(command -v xset)" ]
then
    xset b off

    xset mouse 0 0

    xset r rate 250 50

    xset dpms force on
    xset s default

    xset fp rehash
fi

#[ "$(command -v urxvtd)" ] && \
urxvtd -q -o -f

[ "$(command -v setxkbmap)" ] && \
    setxkbmap -layout "us, ru" -option "grp:win_space_toggle" -option "compose:menu"

#[ "$(command -v xmodmap)" ] && [ -f "${HOME}/.xmodmaprc" ] && \
#    xmodmap "${HOME}/.xmodmaprc"

#if [ "$(command -v xsetroot)" ] && xsetroot -cursor_name left_ptr

if [ "$(command -v hsetroot)" ]
then
    #hsetroot -center "${HOME}/pictures/wallpapers/mill.png"
    hsetroot -cover "${HOME}/pictures/wallpapers/danish_soldiers_return_to_copenhagen.jpg"
fi

[ "$(command -v unclutter)" ] && unclutter --fork --ignore-scrolling

if [ "$(command -v autocutsel)" ]
then
    autocutsel -fork
    autocutsel -fork -selection PRIMARY
fi

if [ "$(command -v fcitx)" ]
then
    export XMODIFIERS="@im=fcitx"
    export GTK_IM_MODULE="fcitx"
    export QT_IM_MODULE="fcitx"

    fcitx -r -d -s 0 &
fi

[ "$(command -v compton)" ] && compton -b

exec xmonad
