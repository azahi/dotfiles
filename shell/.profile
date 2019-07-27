#!/bin/sh

export HISTSIZE=100000
export SAVEHIST=100000

appendpath () {
	[ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
	[ -d "$1" ] || return
	eval echo \$$PATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
	eval export $PATHVAR="\$$PATHVAR:$1"
}
prependpath () {
	[ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
	[ -d "$1" ] || return
	eval echo \$$PATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
	eval export $PATHVAR="$1:\$$PATHVAR"
}

prependpath "$HOME/.emacs.d/bin"
prependpath "$HOME/.cabal/bin"
prependpath "$HOME/.cargo/bin"
prependpath "$HOME/.local/bin"
prependpath "$HOME/.bin"
prependpath "/usr/lib/go/bin"
prependpath "/usr/lib/plan9/bin"
prependpath "/usr/share/languagetool/lib"
prependpath "/usr/local/bin"
prependpath "/usr/bin"
prependpath "/bin"
prependpath "/usr/local/sbin"
prependpath "/usr/sbin"
prependpath "/sbin"

for i in vim vi emacs nano
do
    command -v "$i" >/dev/null 2>&1 && export EDITOR="$i" && break
done
export VISUAL="$EDITOR"
export PAGER="less"
export DIFF="colordiff"
for i in qutebrowser palemoon firefox w3m lynx elinks links
do
    command -v "$i" >/dev/null 2>&1 && export BROWSER="$i" && break
done

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

if [ "$(command -v wine)" ]
then
    export WINEARCH="win32"
    export WINEPREFIX="${HOME}/.wine"
    export WINEDEBUG="-all"
    export WINEDLLOVERRIDES="mscoree,mshtml=;winemenubuilder.exe=d"
fi

if [ "$(command -v nnn)" ]
then
    export NNN_IDLE_TIMEOUT=0
    export NNN_MULTISCRIPT=1
    export NNN_NO_AUTOSELECT=1
    export NNN_QUOTE_ON=1
    export NNN_SHOW_HIDDEN=0
    export NNN_USE_EDITOR=1
    export NNN_TMPFILE="${XDG_CACHE_HOME}/nnn"
fi

if [ "$(command -v dotnet)" ]
then
    prependpath "$HOME/.dotnet/tools"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

    if [ "$(command -v nuget)" ]
    then
        export NUGET_CERT_REVOCATION_MODE="online"
        export NUGET_PERSIST_DG="false"
        export NUGET_RESTORE_MSBUILD_VERBOSITY="normal"
        export NUGET_SHOW_STACK="true"
        export NUGET_XMLDOC_MODE="skip"
    fi
fi

if [ "$(command -v fzf)" ]
then
    export FZF_DEFAULT_COMMAND=""
    export FZF_DEFAULT_OPTS="--height 20% --reverse --border"
fi

[ "$(command -v ranger)" ] && [ -d "$XDG_CONFIG_DIR/ranger" ] && \
    export RANGER_LOAD_DEFAULT_RC="false"

[ "$(command -v beets)" ] && export BEETSDIR="${XDG_DATA_HOME}/beets"

if [ "$(command -v rust)" ] || [ "$(command -v rust-bin)" ]
then
    export CARGO_HOME="${HOME}/.cargo"
    export CARGO_CACHE_RUSTC_INFO=0
fi

[ "$(command -v ccache)" ] && export CCACHE_DIR="${XDG_CACHE_HOME}/ccache"

if [ "$(command -v dbus-daemon)" ] && [ "$(uname -o)" = "GNU/Linux" ]
then
    export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
fi

[ "$(command -v gpg)" ] && export GNUPGHOME="${HOME}/.gnupg"

if [ "$(command -v go)" ]
then
    export GOPATH="${HOME}/.go"

    prependpath "$HOME/.go/bin"
fi

for i in pass gopass
do
    command -v "$i" >/dev/null 2>&1 && \
        export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass" && break
done

export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk2/settings.ini"
export GTK_RC_FILES="${XDG_CONFIG_HOME}/gtk/settings.ini"

for i in python python2 python3
do
    command -v >/dev/null 2>&1 "$i" && export PYTHONSTARTUP="${HOME}/.pystartup" && break
done

export LESSHISTFILE="-"

if [ "$(command -v weechat)" ]
then
    export WEECHAT_HOME="${HOME}/.weechat"
    export WEECHAT_PASSPHRASE="${HOME}/.weechat/pass"
fi

[ "$HOST" = "tp-gentoo" ] && \
    export XAUTHORITY="${XDG_DATA_HOME}/xorg/Xauthority"
