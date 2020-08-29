#!/bin/sh

DESKTOP_DIR="${HOME}/documents"
DOCUMENTS_DIR="${HOME}/documents"
DOWNLOAD_DIR="${HOME}/downloads"
MUSIC_DIR="${HOME}/music"
PICTURES_DIR="${HOME}/pictures"
PUBLICSHARE_DIR="${HOME}/documents"
TEMPLATES_DIR="${HOME}/documents"
VIDEOS_DIR="${HOME}/videos"

export XDG_CACHE_HOME="/tmp/.private/${USER}"
export XDG_CONFIG_HOME="$HOME/.etc"
export XDG_DATA_HOME="$HOME/.var"
if [ "$(uname)" != "Darwin" ]
then
    export XDG_DESKTOP_DIR="${DESKTOP_DIR}"
    export XDG_DOCUMENTS_DIR="${DOCUMENTS_DIR}"
    export XDG_DOWNLOAD_DIR="${DOWNLOAD_DIR}"
    export XDG_MUSIC_DIR="${MUSIC_DIR}"
    export XDG_PICTURES_DIR="${PICTURES_DIR}"
    export XDG_PUBLICSHARE_DIR="${PUBLICSHARE_DIR}"
    export XDG_TEMPLATES_DIR="${TEMPLATES_DIR}"
    export XDG_VIDEOS_DIR="${VIDEOS_DIR}"
else
    export XDG_DESKTOP_DIR="${HOME}/Desktop"
    export XDG_DOCUMENTS_DIR="${HOME}/Documents"
    export XDG_DOWNLOAD_DIR="${HOME}/Downloads"
    export XDG_MUSIC_DIR="${HOME}/Music"
    export XDG_PICTURES_DIR="${HOME}/Pictures"
    export XDG_PUBLICSHARE_DIR="${HOME}/Documents"
    export XDG_TEMPLATES_DIR="${HOME}/Documents"
    export XDG_VIDEOS_DIR="${HOME}/Documents"

    [ ! -f "${DESKTOP_DIR}" ]   && ln -s "${DESKTOP_DIR}"   "${XDG_DESKTOP_DIR}"
    [ ! -f "${DOCUMENTS_DIR}" ] && ln -s "${DOCUMENTS_DIR}" "${XDG_DOCUMENTS_DIR}"
    [ ! -f "${DOWNLOAD_DIR}" ]  && ln -s "${DOWNLOAD_DIR}"  "${XDG_DOWNLOAD_DIR}"
    [ ! -f "${MUSIC_DIR}" ]     && ln -s "${MUSIC_DIR}"     "${XDG_MUSIC_DIR}"
    [ ! -f "${PICTURES_DIR}" ]  && ln -s "${PICTURES_DIR}"  "${XDG_PICTURES_DIR}"
    [ ! -f "${VIDEOS_DIR}" ]    && ln -s "${VIDEOS_DIR}"    "${XDG_VIDEOS_DIR}"
fi

[ ! -d "${XDG_CACHE_HOME}" ]      && mkdir -p "${XDG_CACHE_HOME}"
[ ! -d "${XDG_CONFIG_HOME}" ]     && mkdir -p "${XDG_CONFIG_HOME}"
[ ! -d "${XDG_DATA_HOME}" ]       && mkdir -p "${XDG_DATA_HOME}"
[ ! -d "${XDG_DESKTOP_DIR}" ]     && mkdir -p "${XDG_DESKTOP_DIR}"
[ ! -d "${XDG_DOCUMENTS_DIR}" ]   && mkdir -p "${XDG_DOCUMENTS_DIR}"
[ ! -d "${XDG_DOWNLOAD_DIR}" ]    && mkdir -p "${XDG_DOWNLOAD_DIR}"
[ ! -d "${XDG_MUSIC_DIR}" ]       && mkdir -p "${XDG_MUSIC_DIR}"
[ ! -d "${XDG_PICTURES_DIR}" ]    && mkdir -p "${XDG_PICTURES_DIR}"
[ ! -d "${XDG_PUBLICSHARE_DIR}" ] && mkdir -p "${XDG_PUBLICSHARE_DIR}"
[ ! -d "${XDG_TEMPLATES_DIR}" ]   && mkdir -p "${XDG_TEMPLATES_DIR}"
[ ! -d "${XDG_VIDEOS_DIR}" ]      && mkdir -p "${XDG_VIDEOS_DIR}"
