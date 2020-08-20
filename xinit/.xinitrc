#!/bin/sh

cd "$HOME" || exit

if command -v xrdb >/dev/null 2>&1 && [ -f "$HOME/.Xresources" ]
then
    xrdb "$HOME/.Xresources"
fi

if command -v xset >/dev/null 2>&1
then
    xset b off

    xset mouse 0 0

    xset r rate 300 50

    xset dpms force on
    xset s default

    xset fp rehash
fi

if command -v setxkbmap >/dev/null 2>&1
then
    setxkbmap -layout "us,ru" -option "grp:win_space_toggle" -option "compose:menu" -option "caps:escape"
fi

if command -v xbindkeys >/dev/null 2>&1 && [ -f "$HOME/.xbindkeysrc" ]
then
    xbindkeys
fi

if command -v hsetroot >/dev/null 2>&1
then
    PAPE="$HOME/pictures/wallpapers/mill-blur.png"
    [ -f "$PAPE" ] && \
        hsetroot -cover "$PAPE"
fi

if command -v unclutter >/dev/null 2>&1
then
    unclutter --timeout 3 --ignore-scrolling --fork
fi

if command -v autocutsel >/dev/null 2>&1
then
    autocutsel -fork && autocutsel -fork -selection PRIMARY
fi

if command -v picom >/dev/null 2>&1
then
    picom --daemon
fi

for i in dwm xmonad-ng xmonad
do
    command -v "$i" >/dev/null 2>&1 && \
        exec "$i"
done
