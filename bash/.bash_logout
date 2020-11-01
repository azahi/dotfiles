#/bin/bash

rm_existing()
{
    ( [ -f "${1}" ] || [ -d "${1}" ] ) && rm -rf "${1}"
}

rm_existing "$HOME/.cache"
rm_existing "$HOME/.gdb_history"
rm_existing "$HOME/.wget-hsts"
rm_existing "$HOME/VideoDecodeStats"
rm_existing "$HOME/databases-incognito"
rm_existing "$HOME/pgadmin.log"
rm_existing "$HOME/shared_proto_db"
