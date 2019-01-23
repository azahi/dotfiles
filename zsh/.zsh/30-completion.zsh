#!/usr/bin/env zsh

autoload compinit && compinit -d "${XDG_DATA_HOME}/zsh/zcompdump"

zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 3

zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select auto
zstyle ':completion:*' separate-sectoins false

zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found'

zstyle ':completion:*:*:mpv:*' file-sort name
zstyle ':completion:*:*:mpv:*' file-patterns \
    '*.(#i)(mp3|flac|alac|ape|ogg|wav|mkv|avi|webm|mp4|srt)(-.) *(-/):directories' \
    '*:all-files'
zstyle ':completion:*:*:mpv:*' tag-order '!urls'
zstyle ':completion:*:*:mpv:*' ignored-patterns '(memory)://'

zstyle ':completion:*:kill:*:process' list-colors '-(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
