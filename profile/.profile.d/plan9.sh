#!/bin/sh

_plan9_root="/opt/plan9"

if [ -d "${_plan9_root}" ]; then
    path_append "${_plan9_root}/bin"
    manpath_append "${_plan9_root}/man"
fi

unset _plan9_root
