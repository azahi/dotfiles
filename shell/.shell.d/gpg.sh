#!/bin/sh

for i in gpg gpg2
do
    command -v "$i" > /dev/null 2>&1 && \
        export GNUPGHOME="$HOME/.gnupg" && \
        break
done
