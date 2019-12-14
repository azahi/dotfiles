if [ -z "$LANG" ]
then
    export LANG="en_US.UTF-8"
fi
export LC_ADDRESS="$LANG"
export LC_ALL="$LANG"
export LC_COLLATE="$LANG"
export LC_CTYPE="$LANG"
export LC_IDENTIFICATION="$LANG"
export LC_MEASUREMENT="$LANG"
export LC_MESSAGES="$LANG"
export LC_MONETARY="$LANG"
export LC_NAME="$LANG"
export LC_NUMERIC="$LANG"
export LC_PAPER="$LANG"
export LC_TELEPHONE="$LANG"
export LC_TIME="$LANG"

export HISTFILE="$HOME/.shell.d/.history"
export HISTSIZE=100000

if [ "$OSTYPE" = "linux-gnu" ]
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

path_append ()
{
    [ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
    [ -d "$1" ] || return
    eval echo \$$PATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
    eval export $PATHVAR="\$$PATHVAR:$1"
}
path_prepend ()
{
    [ $# -eq 2 ] && PATHVAR=$2 || PATHVAR=PATH
    [ -d "$1" ] || return
    eval echo \$$PATHVAR | grep -q "\(:\|^\)$1\(:\|$\)" && return
    eval export $PATHVAR="$1:\$$PATHVAR"
}
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.bin"
path_prepend "/usr/lib/plan9/bin"
path_prepend "/usr/local/sbin"
path_prepend "/usr/local/bin"
path_prepend "/usr/sbin"
path_prepend "/usr/bin"
path_prepend "/sbin"
path_prepend "/bin"

if command -v brew > /dev/null 2>&1 || [ -d "$HOME/.brew" ]
then
    path_prepend "$HOME/.brew/sbin"
    path_prepend "$HOME/.brew/bin"

    export HOMEBREW_CACHE="$XDG_CACHE_HOME/homebrew/cache"
    export HOMEBREW_TEMP="$XDG_CACHE_HOME/homebrew/temp"

    [ ! -d "$HOMEBREW_CACHE" ] && mkdir -p "$HOMEBREW_CACHE"
    [ ! -d "$HOMEBREW_TEMP" ] && mkdir -p "$HOMEBREW_TEMP"

    if df -T autofs,nfs "$HOME" > /dev/null 2>&1
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

if [ "$OSTYPE" = "linux-gnu" ]
then
    if grep -q Microsoft /proc/version > /dev/null 2>&1
    then
        alias open="explorer.exe"
    elif command -v xdg-open > /dev/null 2>&1
    then
        alias open="xdg-open"
    fi
fi

for i in nvim vim vi emacs nano ed open
do
    command -v "$i" > /dev/null 2>&1 && \
        export EDITOR="$i" VISUAL="$i" && \
        break
done

for i in bat less more cat
do
    command -v "$i" > /dev/null 2>&1 && \
        export PAGER="$i" && \
        export MANPAGER="$PAGER" && \
        break
done

for i in cdiff colordiff diff
do
    command -v "$i" > /dev/null 2>&1 && \
        export DIFF="$i" && \
        break
done

for i in qutebrowser palemoon firefox chromium chrome safari w3m lynx elinks links open
do
    command -v "$i" > /dev/null 2>&1 && \
        export BROWSER="$i" && \
        break
done

if command -v emacs > /dev/null 2>&1
then
    alias e="emacs --no-window-system"
    alias ec="emacsclient --no-window-system"

    path_prepend "$HOME/.emacs.d/bin"
fi

for i in nvim vim vi
do
    # shellcheck disable=SC2139
    command -v "$i" > /dev/null 2>&1 && \
        alias vim="$i" && \
        alias v="$i" && \
        break
done

for i in python python3 python2
do
    if command -v "$i" > /dev/null 2>&1
    then
        [ -f "$HOME/.pystartup" ] && \
            export PYTHONSTARTUP="$HOME/.pystartup"

        if [ ! "$OSTYPE" = "linux-gnu" ]
        then
            for j in "$HOME/Library/Python/"*
            do
                path_prepend "$j/bin"
            done
        fi

        alias pipup="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

        break
    fi
done

if command -v dotnet > /dev/null 2>&1
then
    path_prepend "$HOME/.dotnet/tools"

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

    if command -v nuget > /dev/null 2>&1
    then
        export NUGET_CERT_REVOCATION_MODE="online"
        export NUGET_PERSIST_DG="false"
        export NUGET_RESTORE_MSBUILD_VERBOSITY="normal"
        export NUGET_SHOW_STACK="true"
        export NUGET_XMLDOC_MODE="skip"
    fi
fi

if command -v cargo > /dev/null 2>&1
then
    path_prepend "$HOME/.cargo/bin"

    export CARGO_HOME="$HOME/.cargo"
    export CARGO_CACHE_RUSTC_INFO=0
fi

if command -v go > /dev/null 2>&1
then
    export GOPATH="$HOME/.go"

    path_prepend "$HOME/.go/bin"
fi

if command -v ruby > /dev/null 2>&1
then
    path_prepend "$HOME/.rvm/bin"

    # shellcheck disable=SC1090
    [ -s "$HOME/.rvm/scripts/rvm" ] && \
        source "$HOME/.rvm/scripts/rvm"

    for i in "$HOME/.gem/ruby/"*
    do
        path_prepend "$i/bin"
    done
fi

if command -v opam > /dev/null 2>&1
then
    # shellcheck disable=SC1090
    [ -f "$HOME/.opam/opam-init/init.sh" ] &&
        . "$HOME/.opam/opam-init/init.sh" > /dev/null 2>&1

    path_prepend "$HOME/.opam/default/bin"
    path_prepend "$HOME/.opam/default/sbin"
fi

if command -v cabal > /dev/null 2>&1
then
    path_prepend "$HOME/.cabal/bin"
fi

if command -v git > /dev/null 2>&1
then
    command -v hub > /dev/null 2>&1 && \
        alias git="hub"
    alias g="git"
fi

if command -v wine > /dev/null 2>&1
then
    export WINEARCH="win32"
    export WINEPREFIX="$HOME/.wine"
    export WINEDEBUG="-all"
    export WINEDLLOVERRIDES="mscoree,mshtml=;winemenubuilder.exe=d"

    alias winep="wine explorer.exe /desktop=default,1600x900"
fi

if command -v nnn > /dev/null 2>&1
then
    export NNN_MULTISCRIPT=1
    export NNN_NO_AUTOSELECT=1
    export NNN_QUOTE_ON=1
    export NNN_TMPFILE="$XDG_CACHE_HOME/nnn"
    export NNN_TRASH=0
    export NNN_USE_EDITOR=1
    export NNN_OPENER="open"

    alias n="nnn"
fi

if command -v ranger > /dev/null 2>&1 && [ -d "$XDG_CONFIG_HOME/ranger" ]
then
    export RANGER_LOAD_DEFAULT_RC="false"
fi

if command -v ag > /dev/null 2>&1
then
    alias ag="ag --color"
fi

if command -v fzf > /dev/null 2>&1
then
    export FZF_DEFAULT_COMMAND=""
    export FZF_DEFAULT_OPTS="--height 20% --reverse --border"
fi

if command -v beet > /dev/null 2>&1
then
    export BEETSDIR="$XDG_DATA_HOME/beets"

    # shellcheck disable=SC2139
    [ -f "$XDG_CONFIG_HOME/beets/config.yaml" ] && \
        alias beet="beet -c $XDG_CONFIG_HOME/beets/config.yaml"
fi

if command -v dbus-daemon > /dev/null 2>&1 && [ "$OSTYPE" = "linux-gnu" ]
then
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
fi

for i in gpg gpg2
do
    command -v "$i" > /dev/null 2>&1 && \
        export GNUPGHOME="$HOME/.gnupg" && \
        break
done

if command -v pass > /dev/null 2>&1
then
    export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
fi

if command -v weechat > /dev/null 2>&1
then
    export WEECHAT_HOME="$HOME/.weechat"
    export WEECHAT_PASSPHRASE="$WEECHAT_HOME/pass"
fi

if command -v xauth > /dev/null 2>&1
then
    export XAUTHORITY="$XDG_DATA_HOME/xorg/.Xauthority"
fi

if command -v startx > /dev/null 2>&1
then
    alias sx="startx -- vt1 -nolisten tcp"
fi

if command -v rsync > /dev/null 2>&1
then
    alias rsync-cp="rsync --archive --compress --verbose --progress --human-readable"
    alias rsync-mv="rsync --archive --compress --verbose --progress --human-readable --remove-source-files"
    alias rsync-sync="rsync --archive --compress --verbose --progress --human-readable --update --delete"
    alias rsync-update="rsync --archive --compress --verbose --progress --human-readable --update"
fi

if command -v torrentinfo > /dev/null 2>&1
then
    alias torrentinfo="torrentinfo --everything"
fi

if command -v units > /dev/null 2>&1
then
    # shellcheck disable=SC2139
    alias units="units --history=$XDG_DATA_HOME/units_history"
fi

if command -v less > /dev/null 2>&1
then
    export LESS="-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]"
    export LESSCHARSET='utf-8'
    export LESSHISTFILE="-"
fi

if command -v ccache > /dev/null 2>&1
then
    export CCACHE_DIR="$HOME/.ccache"
    if [ -f "/usr/lib/ccache/bin" ]
    then
        export CCACHE_PATH="/usr/lib/ccache/bin:$PATH"
    else
        export CCACHE_PATH="$PATH"
    fi
fi

if command -v wget > /dev/null 2>&1
then
    # shellcheck disable=SC2139
    alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
fi

if command -v df > /dev/null 2>&1
then
    alias disk="df --human-readable --exclude-type=tmpfs --exclude-type=devtmpfs"
fi

if command -v free > /dev/null 2>&1
then
    alias ram="free --human --wide | sed -e '/^Swap/d'"
fi

if ! command -v hd > /dev/null 2>&1 && command -v hexdump > /dev/null 2>&1
then
    alias hd="hexdump -C"
fi

if ! command -v md5sum > /dev/null 2>&1 && command -v md5 > /dev/null 2>&1
then
    alias md5sum="md5"
fi

if ! command -v sha1sum > /dev/null 2>&1 && command -v shasum > /dev/null 2>&1
then
    alias sha1sum="shasum"
fi

if ls --color > /dev/null 2>&1
then
    alias ls="ls --color=auto --group-directories-first --human-readable --indicator-style=classify"
    alias ll="ls --color=auto --group-directories-first --human-readable --indicator-style=classify --format=verbose"
    alias la="ls --color=auto --group-directories-first --human-readable --indicator-style=classify --format=verbose --all"
else
    alias ls="ls -G -p"
    alias ll="ls -G -p -l"
    alias la="ls -G -p -l -a"
fi

if command -v gls > /dev/null 2>&1
then
    alias gls="gls --color=auto --group-directories-first --human-readable --indicator-style=classify"
    alias gll="gls --color=auto --group-directories-first --human-readable --indicator-style=classify --format=verbose"
    alias gla="gls --color=auto --group-directories-first --human-readable --indicator-style=classify --format=verbose --all"
fi

alias cp="cp -v -i"
alias ln="ln -v -i"
alias mv="mv -v -i"
alias rm="rm -v -I"
alias mkdir="mkdir -v -p"

alias grep="grep --color=auto"
alias egrep="grep --color=auto"
alias fgrep="grep --color=auto"

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias week="date +%V"

alias path='echo -e ${PATH//:/\\n} | sort'

for i in "$HOME/.shell.d/"*.sh
do
    # shellcheck disable=SC1090
    source "$i"
done
