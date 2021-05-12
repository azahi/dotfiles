#!/bin/sh

_local="${HOME}/.local"

export XDG_CACHE_HOME="${_local}/var/cache"
export XDG_CONFIG_HOME="${_local}/etc"
export XDG_DATA_HOME="${_local}/var/lib"
export XDG_DESKTOP_DIR="${HOME}/documents"
export XDG_DOCUMENTS_DIR="${HOME}/documents"
export XDG_DOWNLOAD_DIR="${HOME}/downloads"
export XDG_MUSIC_DIR="${HOME}/music"
export XDG_PICTURES_DIR="${HOME}/pictures"
export XDG_PUBLICSHARE_DIR="${HOME}/documents"
export XDG_RUNTIME_DIR="${_local}/var/run"
export XDG_TEMPLATES_DIR="${HOME}/documents"
export XDG_VIDEOS_DIR="${HOME}/videos"

unset _local

_xdg_dirs="
    ${XDG_CACHE_HOME}
    ${XDG_CONFIG_HOME}
    ${XDG_DATA_HOME}
    ${XDG_DESKTOP_DIR}
    ${XDG_DOCUMENTS_DIR}
    ${XDG_DOWNLOAD_DIR}
    ${XDG_MUSIC_DIR}
    ${XDG_PICTURES_DIR}
    ${XDG_PUBLICSHARE_DIR}
    ${XDG_RUNTIME_DIR}
    ${XDG_TEMPLATES_DIR}
    ${XDG_VIDEOS_DIR}
"

for _xdg_dir in ${_xdg_dirs}; do
	[ ! -d "${_xdg_dir}" ] && mkdir -p "${_xdg_dir}"
done

unset _xdg_dir _xdg_dirs
