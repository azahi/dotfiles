#!/bin/sh

if command -v gpg >/dev/null 2>&1; then
    GPG_TTY="$(tty)"
    export GPG_TTY

    if command -v ssh >/dev/null 2>&1 &&
        command -v gpgconf >/dev/null 2>&1; then
        unset SSH_AGENT_PID
        if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne "${$}" ]; then
            SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
            export SSH_AUTH_SOCK
        fi
    fi

    if command -v gpg-connect-agent >/dev/null 2>&1 &&
        [ "${TERM}" != "linux" ]; then
        gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
    fi
fi
