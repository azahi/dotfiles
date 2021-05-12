#!/bin/sh

if [ -x "${HOME}/.emacs.d/bin/doom" ]; then
	path_append "${HOME}/.emacs.d/bin"
fi
