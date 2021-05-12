#!/bin/sh

if command -v urxvt >/dev/null 2>&1; then
	export RXVT_SOCKET="${XDG_RUNTIME_DIR}/urxvtd.socket"
	export URXVT_PERL_LIB="${XDG_DATA_HOME}/urxvt/ext"
fi
