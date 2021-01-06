#!/bin/sh

if command -v hledger >/dev/null 2>&1
then
    export LEDGER_FILE="${XDG_DOCUMENTS_DIR}/accounting/current.journal"
fi
