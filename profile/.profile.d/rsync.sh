#!/bin/sh
#shellcheck disable=SC2139

if command -v rsync >/dev/null 2>&1; then
	_rsync_cp="rsync --archive --compress --verbose --progress --human-readable"

	alias rsync-cp="${_rsync_cp}"
	alias rsync-mv="${_rsync_cp} --remove-source-files"
	alias rsync-sync="${_rsync_cp} --update --delete"

	unset _rsync_cp
fi
