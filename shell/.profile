export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export DIFF="colordiff"
export BROWSER="qutebrowser"

export XDG_CACHE_HOME="/tmp/.private/${USER}"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DESKTOP_DIR="${HOME}/documents"
export XDG_DOCUMENTS_DIR="${HOME}/documents"
export XDG_DOWNLOAD_DIR="${HOME}/downloads"
export XDG_MUSIC_DIR="${HOME}/audios"
export XDG_PICTURES_DIR="${HOME}/pictures"
export XDG_PUBLICSHARE_DIR="${HOME}/documents"
export XDG_RUNTIME_DIR="/run/user/${UID}"
export XDG_TEMPLATES_DIR="${HOME}/documents"
export XDG_VIDEOS_DIR="${HOME}/videos"

export WINEARCH="win32"
export WINEPREFIX="${HOME}/.wine32"
export WINEDEBUG="-all"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"

export NNN_BMS="d:~/downloads;w:~/work;p:/etc/portage"
export NNN_COPIER="IFS= ; echo -n $1 | xclip"
export NNN_IDLE_TIMEOUT=0
export NNN_MULTISCRIPT=1
export NNN_NO_AUTOSELECT=1
export NNN_QUOTE_ON=1
export NNN_SHOW_HIDDEN=0
export NNN_USE_EDITOR=1

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
export EIX_LIMIT=50
export FZF_DEFAULT_OPTS="--height 20% --reverse --border"
export GCC_COLORS=1
export HISTSIZE=100000
export KEYTIMEOUT=1
export NUGET_XMLDOC_MODE="skip"
export RANGER_LOAD_DEFAULT_RC=false
export SAVEHIST=100000

export BEETSDIR="${XDG_DATA_HOME}/beets"
export CARGO_HOME="${HOME}/.cargo"
export CCACHE_DIR="${XDG_CACHE_HOME}/ccache"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
export GNUPGHOME="${HOME}/.gnupg"
export GOPATH="${HOME}/.go"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk2/settings.ini"
export GTK_RC_FILES="${XDG_CONFIG_HOME}/gtk/settings.ini"
export HISTFILE="${XDG_DATA_HOME}/zsh/histfile"
export INPUTRC="${XDG_CONFIG_HOME}/readline/inputrc"
export LESSHISTFILE="/dev/null"
export NNN_TMPFILE="${XDG_CACHE_HOME}/nnn_tmpfile"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass"
export PGPASSFILE="${XDG_CONFIG_HOME}/postgrsql/pass"
export PGSERVICEFILE="${XDG_CONFIG_HOME}/postgresql/service.conf"
export PSQLRC="${XDG_CONFIG_HOME}/postgresql/sqlrc"
export PSQL_HISTORY="${XDG_DATA_HOME}/postgrsql/history"
export PYTHONSTARTUP="${HOME}/.pystartup"
export R_HISTFILE="${XDG_DATA_HOME}/R/history"
export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"
export WEECHAT_HOME="${HOME}/.weechat"
export WEECHAT_PASSPHRASE="${HOME}/.weechat/passphrase"
export XAUTHORITY="${XDG_DATA_HOME}/xorg/Xauthority"
