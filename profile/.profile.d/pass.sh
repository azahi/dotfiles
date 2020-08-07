#!/bin/sh

for i in gopass pass
do
    command -v "$i" >/dev/null 2>&1 && \
        export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass" && \
        break
done
