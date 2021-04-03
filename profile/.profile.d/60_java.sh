#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING="1"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

if command -v java >/dev/null 2>&1; then
    if [ -n "${JAVA_HOME}" ]; then
        export JAVA_HOME="${HOME}/.gentoo/java-config-2/current-user-vm"
    fi
    path_append "${JAVA_HOME}/bin"
    manpath_append "${JAVA_HOME}/man"
fi
