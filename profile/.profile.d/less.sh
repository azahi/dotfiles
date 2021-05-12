#!/bin/sh

if command -v less >/dev/null 2>&1; then
	export LESSHISTFILE="/dev/null"
	export LESSHISTSIZE=0
fi
