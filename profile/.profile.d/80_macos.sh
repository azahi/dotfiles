#!/bin/sh

if [ "$(uname)" = "Darwin" ]
then
    alias finder_hide="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias finder_unhide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

    alias mute="osascript -e 'set volume output muted true'"

    alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
fi
