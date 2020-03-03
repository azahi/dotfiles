#!/bin/sh

if [ "$(uname)" = "Linux" ]
then
    export XDG_CACHE_HOME="/tmp/.private/$USER"
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_DESKTOP_DIR="$HOME/documents"
    export XDG_DOCUMENTS_DIR="$HOME/documents"
    export XDG_DOWNLOAD_DIR="$HOME/downloads"
    export XDG_MUSIC_DIR="$HOME/audios"
    export XDG_PICTURES_DIR="$HOME/pictures"
    export XDG_PUBLICSHARE_DIR="$HOME/documents"
    export XDG_TEMPLATES_DIR="$HOME/documents"
    export XDG_VIDEOS_DIR="$HOME/videos"
else
    export XDG_CACHE_HOME="/tmp/$USER"
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_DESKTOP_DIR="$HOME/Desktop"
    export XDG_DOCUMENTS_DIR="$HOME/Documents"
    export XDG_DOWNLOAD_DIR="$HOME/Downloads"
    export XDG_MUSIC_DIR="$HOME/Music"
    export XDG_PICTURES_DIR="$HOME/Pictures"
    export XDG_PUBLICSHARE_DIR="$HOME/Documents"
    export XDG_TEMPLATES_DIR="$HOME/Documents"
    export XDG_VIDEOS_DIR="$HOME/Documents"
fi

[ ! -d "$XDG_CONFIG_HOME" ]     && mkdir -p "$XDG_CONFIG_HOME"
[ ! -d "$XDG_DATA_HOME" ]       && mkdir -p "$XDG_DATA_HOME"
[ ! -d "$XDG_DESKTOP_DIR" ]     && mkdir -p "$XDG_DESKTOP_DIR"
[ ! -d "$XDG_DOCUMENTS_DIR" ]   && mkdir -p "$XDG_DOCUMENTS_DIR"
[ ! -d "$XDG_DOWNLOAD_DIR" ]    && mkdir -p "$XDG_DOWNLOAD_DIR"
[ ! -d "$XDG_MUSIC_DIR" ]       && mkdir -p "$XDG_MUSIC_DIR"
[ ! -d "$XDG_PICTURES_DIR" ]    && mkdir -p "$XDG_PICTURES_DIR"
[ ! -d "$XDG_PUBLICSHARE_DIR" ] && mkdir -p "$XDG_PUBLICSHARE_DIR"
[ ! -d "$XDG_TEMPLATES_DIR" ]   && mkdir -p "$XDG_TEMPLATES_DIR"
[ ! -d "$XDG_VIDEOS_DIR" ]      && mkdir -p "$XDG_VIDEOS_DIR"
