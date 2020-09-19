#!/bin/sh

for i in gpg gpg2
do
    # shellcheck disable=SC2139
    command -v "$i" >/dev/null 2>&1 && \
        export GNUPGHOME="${HOME}/.gnupg" && \
        export GPG_TTY="$(tty)" && \
        break
done
