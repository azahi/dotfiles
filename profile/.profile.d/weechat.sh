#!/bin/sh

if command -v weechat >/dev/null 2>&1
then
    export WEECHAT_HOME="$HOME/.weechat"
fi