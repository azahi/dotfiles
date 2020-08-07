#!/bin/sh

if command -v rsync >/dev/null 2>&1
then
    alias rsync-cp="rsync --archive --compress --verbose --progress --human-readable"
    alias rsync-mv="rsync --archive --compress --verbose --progress --human-readable --remove-source-files"
    alias rsync-sync="rsync --archive --compress --verbose --progress --human-readable --update --delete"
fi
