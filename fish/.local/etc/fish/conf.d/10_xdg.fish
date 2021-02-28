#!/bin/fish

set -x XDG_CACHE_HOME       "$HOME/.local/var/cache"
set -x XDG_CONFIG_HOME      "$HOME/.local/etc"
set -x XDG_DATA_HOME        "$HOME/.local/var/lib"
set -x XDG_DESKTOP_DIR      "$HOME/documents"
set -x XDG_DOCUMENTS_DIR    "$HOME/documents"
set -x XDG_DOWNLOAD_DIR     "$HOME/downloads"
set -x XDG_MUSIC_DIR        "$HOME/music"
set -x XDG_PICTURES_DIR     "$HOME/pictures"
set -x XDG_PUBLICSHARE_DIR  "$HOME/documents"
set -x XDG_RUNTIME_DIR      "$HOME/.local/var/run"
set -x XDG_TEMPLATES_DIR    "$HOME/documents"
set -x XDG_VIDEOS_DIR       "$HOME/videos"

set xdg_dirs
set -a xdg_dirs $XDG_CACHE_HOME
set -a xdg_dirs $XDG_CONFIG_HOME
set -a xdg_dirs $XDG_DATA_HOME
set -a xdg_dirs $XDG_DESKTOP_DIR
set -a xdg_dirs $XDG_DOCUMENTS_DIR
set -a xdg_dirs $XDG_DOWNLOAD_DIR
set -a xdg_dirs $XDG_MUSIC_DIR
set -a xdg_dirs $XDG_PICTURES_DIR
set -a xdg_dirs $XDG_PUBLICSHARE_DIR
set -a xdg_dirs $XDG_RUNTIME_DIR
set -a xdg_dirs $XDG_TEMPLATES_DIR
set -a xdg_dirs $XDG_VIDEOS_DIR

for i in $xdg_dirs
    if ! test -d $i
        mkdir -p $i
    end
end

set -e xdg_dirs
