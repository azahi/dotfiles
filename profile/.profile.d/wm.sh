#!/bin/sh

for WM in 2bwm dwm xmonad-ng xmonad
do
    if pgrep "${WM}" >/dev/null 2>&1
    then
        export WM
        break
    fi
done
