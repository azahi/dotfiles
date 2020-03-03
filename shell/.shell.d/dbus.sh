#!/bin/sh

if command -v dbus-daemon > /dev/null 2>&1 && [ "$(uname)" = "Linux" ]
then
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
fi
