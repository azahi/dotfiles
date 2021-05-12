#!/bin/sh

if command -v uim-xim >/dev/null 2>&1; then
	export GTK_IM_MODULE="uim"
	export QT_IM_MODULE="uim"
	export SHORT_DESC="UIM"
	export UIM_FEP="skk"
	export XIM="uim"
	export XIM_ARGS=
	export XIM_PROGRAM="uim-xim"
	export XMODIFIERS="@im=uim"
fi
