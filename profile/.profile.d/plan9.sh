#!/bin/sh

if [ -d /opt/plan9 ]
then
    path_append "/opt/plan9/bin"
    path_append "/opt/plan9/bin/disk"
    path_append "/opt/plan9/bin/fossil"
    path_append "/opt/plan9/bin/fs"
    path_append "/opt/plan9/bin/upas"
    path_append "/opt/plan9/bin/venti"
fi
