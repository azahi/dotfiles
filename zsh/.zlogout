#!/usr/bin/env zsh

rm_existing()
{
    ( [ -f "$1" ] || [ -d "$1" ] ) && rm -rf "$1"
}

rm_existing "${ZCOMPDUMP}.zwc.old"
rm_existing "${ZLOGIN}.zwc.old"
rm_existing "${ZLOGOUT}.zwc.old"
rm_existing "${ZPROFILE}.zwc.old"
rm_existing "${ZSHENV}.zwc.old"
rm_existing "${ZSHRC}.zwc.old"

rm_existing "$HOME/.cache"
rm_existing "$HOME/VideoDecodeStats"
rm_existing "$HOME/databases-incognito"
rm_existing "$HOME/shared_proto_db"

unset rm_existing
