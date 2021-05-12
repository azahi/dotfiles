#!/bin/sh

if command -v torrentinfo >/dev/null 2>&1; then
	alias torrentinfo="torrentinfo --everything"
fi
