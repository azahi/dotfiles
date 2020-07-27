#!/bin/sh

[ "$(command -v xrdb)" ] && [ -f "$HOME/.Xresources" ] && \
    xrdb "$HOME/.Xresources"

if [ "$(command -v xset)" ]
then
    xset b off

    xset mouse 0 0

    xset r rate 300 50

    xset dpms force on
    xset s default

    xset fp rehash
fi

[ "$(command -v urxvtd)" ] && \
    urxvtd -q -o -f

[ "$(command -v setxkbmap)" ] && \
    setxkbmap -layout "us, ru" -option "grp:win_space_toggle" -option "compose:menu"

if [ "$(command -v xmodmap)" ] && [ -f "$HOME/.xmodmaprc" ]
then
    xmodmap "$HOME/.xmodmaprc"
fi

[ "$(command -v xsetroot)" ] && \
    xsetroot -cursor_name left_ptr

PAPE="$HOME/pictures/wallpapers/danish_soldiers_return_to_copenhagen.jpg"
[ "$(command -v hsetroot)" ] && [ -f "$PAPE" ] && \
    hsetroot -cover "$PAPE"

[ "$(command -v unclutter)" ] && \
    unclutter --fork --ignore-scrolling

[ "$(command -v autocutsel)" ] && \
    autocutsel -fork && autocutsel -fork -selection PRIMARY

if [ "$(command -v fcitx)" ]
then
    export XMODIFIERS="@im=fcitx"
    export GTK_IM_MODULE="fcitx"
    export QT_IM_MODULE="fcitx"

    fcitx -r -d -s 0 > /dev/null 2>&1
fi

export QT_LOGGIN_RULES="qt5ct.debug=false"
export QT_QPA_PLATFORMTHEME="qt5ct"

[ "$(command -v compton)" ] && \
    compton -b

for i in xmonad-ng xmonad stumpwm bspwm 2bwm dwm twm
do
    command -v "$i" >/dev/null 2>&1 && exec "$i"
done
