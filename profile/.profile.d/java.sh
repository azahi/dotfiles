#!/bin/sh

if command -v java >/dev/null 2>&1
then
    export _JAVA_AWT_WM_NONREPARENTING=1
    export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
fi
