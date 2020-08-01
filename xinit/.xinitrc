#!/bin/sh

cd "$HOME" || exit

[ "$(command -v xrdb)" ] && [ -f "$HOME/.Xresources" ] && \
    xrdb "$HOME/.Xresources"

if command -v xset >/dev/null 2>&1
then
    xset b off

    xset mouse 0 0

    xset r rate 300 50

    xset dpms force on
    xset s default

    xset fp rehash
fi

if command -v urxvtd >/dev/null 2>&1
then
    urxvtd -q -o -f
fi

if command -v setxkbmap >/dev/null 2>&1
then
    setxkbmap -layout "us, ru" -option "grp:win_space_toggle" -option "compose:menu"
fi

if command -v xmodmap >/dev/null 2>&1
then
    [ -f "$HOME/.xmodmaprc" ] && \
        xmodmap "$HOME/.xmodmaprc"
fi

if command -v xsetroot >/dev/null 2>&1
then
    xsetroot -cursor_name left_ptr
fi

if command -v hsetroot >/dev/null 2>&1
then
    PAPE="$HOME/pictures/wallpapers/danish_soldiers_return_to_copenhagen.jpg"
    [ -f "$PAPE" ] && \
        hsetroot -cover "$PAPE"
fi

if command -v unclutter >/dev/null 2>&1
then
    unclutter --fork --ignore-scrolling
fi

if command -v autocutsel >/dev/null 2>&1
then
    autocutsel -fork && autocutsel -fork -selection PRIMARY
fi

if command -v fcitx >/dev/null 2>&1
then
    export XMODIFIERS="@im=fcitx"
    export GTK_IM_MODULE="fcitx"
    export QT_IM_MODULE="fcitx"

    if pgrep mozc_server >/dev/null 2>&1
    then
        pkill mozc_server
    fi

    fcitx -r -d -s 0 >/dev/null 2>&1
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
