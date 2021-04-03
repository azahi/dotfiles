#!/bin/sh

_llvm_root="/usr/lib/llvm"

if [ -d "${_llvm_root}" ]; then
    for _version in "${_llvm_root}"/*; do
        path_append "${_version}/bin"
        manpath_append "${_version}/share/man"
    done
fi

unset _version _llvm_root
