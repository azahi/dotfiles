export HISTFILE="$HOME/.shell.d/.history"
export HISTSIZE=10000

appendpath ()
{
	[ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
	[ -d "$1" ] || return
	eval echo \$$PATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
	eval export $PATHVAR="\$$PATHVAR:$1"
}
prependpath ()
{
	[ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
	[ -d "$1" ] || return
	eval echo \$$PATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
	eval export $PATHVAR="$1:\$$PATHVAR"
}
prependpath "$HOME/.local/bin"
prependpath "$HOME/.bin"
prependpath "/usr/lib/plan9/bin"
prependpath "/usr/local/sbin"
prependpath "/usr/local/bin"
prependpath "/usr/sbin"
prependpath "/usr/bin"
prependpath "/sbin"
prependpath "/bin"

for i in vim vi emacs nano
do
    command -v "$i" >/dev/null 2>&1 && export EDITOR="$i" VISUAL="$i" && break
done

for i in bat less
do
    command -v "$i" >/dev/null 2>&1 && export PAGER="$i" && break
done

for i in ediff cdiff cwdiff wdiff colordiff diff
do
    command -v "$i" >/dev/null 2>&1 && export DIFF="$i" && break
done

for i in qutebrowser palemoon firefox chromium chrome safari open w3m lynx elinks links
do
    command -v "$i" >/dev/null 2>&1 && export BROWSER="$i" && break
done

if [ ! "$(uname)" = "Darwin" ]
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

if command -v emacs >/dev/null 2>&1
then
    alias e="emacs -t"
    alias ec="emacsclient -t"

    if [ -d "$HOME/.doom.d" ]
    then
        prependpath "$HOME/.emacs.d/bin"

        alias d="doom run -nw"
    fi

fi

for i in python python2 python3
do
    if command -v "$i" >/dev/null 2>&1
    then
        [ -f "$HOME/.pystartup" ] && \
            export PYTHONSTARTUP="$HOME/.pystartup"

        prependpath "$HOME/Library/Python/2.7/bin"
        prependpath "$HOME/Library/Python/3.7/bin"
        break
    fi
done

if command -v dotnet >/dev/null 2>&1
then
    prependpath "$HOME/.dotnet/tools"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

    if command -v nuget >/dev/null 2>&1
    then
        export NUGET_CERT_REVOCATION_MODE="online"
        export NUGET_PERSIST_DG="false"
        export NUGET_RESTORE_MSBUILD_VERBOSITY="normal"
        export NUGET_SHOW_STACK="true"
        export NUGET_XMLDOC_MODE="skip"
    fi
fi

if command -v cargo >/dev/null 2>&1
then
    prependpath "$HOME/.cargo/bin"

    export CARGO_HOME="$HOME/.cargo"
    export CARGO_CACHE_RUSTC_INFO=0
fi

if command -v go >/dev/null 2>&1
then
    export GOPATH="$HOME/.go"

    prependpath "$HOME/.go/bin"
fi

if command -v cabal >/dev/null 2>&1
then
    prependpath "$HOME/.cabal/bin"
fi

if command -v wine >/dev/null 2>&1
then
    export WINEARCH="win32"
    export WINEPREFIX="$HOME/.wine"
    export WINEDEBUG="-all"
    export WINEDLLOVERRIDES="mscoree,mshtml=;winemenubuilder.exe=d"

    alias winep="wine explorer.exe /desktop=default,1600x900"
fi

if command -v nnn >/dev/null 2>&1
then
    export NNN_MULTISCRIPT=1
    export NNN_NO_AUTOSELECT=1
    export NNN_QUOTE_ON=1
    export NNN_TMPFILE="$XDG_CACHE_HOME/nnn"
    export NNN_TRASH=0
    export NNN_USE_EDITOR=1
    command -v open >/dev/null 2>&1 && \
        export NNN_OPENER="open"
    command -v xdg-open >/dev/null 2>&1 && \
        export NNN_OPENER="xdg-open"

    alias n="nnn"
fi

if command -v fzf >/dev/null 2>&1
then
    export FZF_DEFAULT_COMMAND=""
    export FZF_DEFAULT_OPTS="--height 20% --reverse --border"
fi

if command -v ranger >/dev/null 2>&1 && [ -d "$XDG_CONFIG_HOME/ranger" ]
then
    export RANGER_LOAD_DEFAULT_RC="false"
fi

if command -v beets >/dev/null 2>&1
then
    export BEETSDIR="$XDG_DATA_HOME/beets"

    alias beet="beet -c \$XDG_CONFIG_HOME/beets/config.yaml"
fi

if command -v dbus-daemon >/dev/null 2>&1 && [ ! "$(uname)" = "Darwin" ]
then
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
fi

if command -v gpg >/dev/null 2>&1
then
    export GNUPGHOME="$HOME/.gnupg"
fi

if command -v pass >/dev/null 2>&1
then
    export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
fi

if command -v weechat >/dev/null 2>&1
then
    export WEECHAT_HOME="$HOME/.weechat"
    export WEECHAT_PASSPHRASE="$WEECHAT_HOME/pass"
fi

if [ "$HOST" = "tp-gentoo" ]
then
    export XAUTHORITY="$XDG_DATA_HOME/xorg/.Xauthority"
fi

# shellcheck disable=2010
if ls --version 2>&1 | grep -q "GNU" >/dev/null
then
    alias ls="ls --color=auto --group-directories-first --human-readable --indicator-style=classify"
    alias ll="ls --color=auto --group-directories-first --human-readable --indicator-style=classify --format=verbose"
    alias la="ls --color=auto --group-directories-first --human-readable --indicator-style=classify --format=verbose --all"
fi

if command -v startx >/dev/null 2>&1
then
    alias sx="startx -- vt1 -nolisten tcp"
fi

if command -v rsync >/dev/null 2>&1
then
    alias rsync-cp="rsync --archive --compress --verbose --progress --human-readable"
    alias rsync-mv="rsync --archive --compress --verbose --progress --human-readable --remove-source-files"
    alias rsync-sync="rsync --archive --compress --verbose --progress --human-readable --update --delete"
    alias rsync-update="rsync --archive --compress --verbose --progress --human-readable --update"
fi

if [ -f "$GOPATH/bin/tewisay" ]
then
    alias tewisay="\$GOPATH/bin/tewisay -f \$GOPATH/src/github.com/lucy/tewisay/cows/tes.cow"
fi

if command -v torrentinfo >/dev/null 2>&1
then
    alias torrentinfo="torrentinfo --everything"
fi

if command -v units >/dev/null 2>&1
then
    alias units="units --history=\$XDG_DATA_HOME/units_history"
fi

if command -v ag >/dev/null 2>&1
then
    alias ag="ag --color"
fi

if command -v less >/dev/null 2>&1
then
    alias less="less --quit-if-one-screen --no-init"

    export LESSHISTFILE="-"
fi

if command -v ccache >/dev/null 2>&1
then
    export CCACHE_DIR="/var/tmp/ccache"
    export CCACHE_PATH="$PATH"

    prependpath "/usr/lib/ccache/bin"
fi

if command -v brew >/dev/null 2>&1 || [ -d "$HOME/.brew" ]
then
    prependpath "$HOME/.brew/bin"

    export HOMEBREW_CACHE="$XDG_CACHE_HOME/homebrew/cache"
    export HOMEBREW_TEMP="$XDG_CACHE_HOME/homebrew/temp"

    [ ! -d "$HOMEBREW_CACHE" ] && mkdir -p "$HOMEBREW_CACHE"
    [ ! -d "$HOMEBREW_TEMP" ] && mkdir -p "$HOMEBREW_TEMP"

    if df -T autofs,nfs "$HOME" 1>/dev/null
    then
        HOMEBREW_LOCKS_TARGET="$XDG_CACHE_HOME/homebrew/locks"
        HOMEBREW_LOCKS_FOLDER="$HOME/.brew/var/homebrew"

        [ ! -d "$HOMEBREW_LOCKS_TARGET" ] && mkdir -p "$HOMEBREW_LOCKS_TARGET"
        [ ! -d "$HOMEBREW_LOCKS_FOLDER" ] && mkdir -p "$HOMEBREW_LOCKS_FOLDER"

        if [ ! -L "$HOMEBREW_LOCKS_FOLDER" ] || [ ! -d "$HOMEBREW_LOCKS_FOLDER" ]
        then
            rm -rf "$HOMEBREW_LOCKS_FOLDER"
            ln -s "$HOMEBREW_LOCKS_TARGET" "$HOMEBREW_LOCKS_FOLDER"
        fi
    fi
fi

for i in "$HOME/.shell.d/"*.sh
do
    # shellcheck disable=SC1090
    source "$i"
done
