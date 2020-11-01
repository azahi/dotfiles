#!/bin/sh

if [ "$(umask)" = "000" ] || [ "$(umask)" = "0000" ]
then
    umask 0022
fi

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

for i in "${HOME}"/.profile.d/*.sh
do
    # shellcheck disable=SC1090
    [ -r "$i" ] && . "$i"
done

if [ -n "${BASH_VERSION}" ] \
&& [ -f "${HOME}/.bashrc" ] \
&& [ "${HOST}" = "sava" ]
then
    # shellcheck disable=SC1090
    . "${HOME}/.bashrc"
fi
