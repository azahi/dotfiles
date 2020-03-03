#!/bin/sh

if [ -f "/etc/profile.env" ]
then
    # shellcheck disable=SC1091
    . "/etc/profile.env"
fi

for i in /etc/profile.d/*.sh
do
    # shellcheck disable=SC1090
    [ -r "$i" ] && . "$i"
done

for i in "$HOME/.shell.d/"*.sh
do
    # shellcheck disable=SC1090
    [ -r "$i" ] && . "$i"
done
