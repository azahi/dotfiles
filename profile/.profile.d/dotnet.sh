#!/bin/sh

if command -v dotnet >/dev/null 2>&1; then
    path_append "${HOME}/.dotnet/tools"

    export DOTNET_CLI_TELEMETRY_OPTOUT="1"
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE="1"

    if command -v nuget >/dev/null 2>&1; then
        export NUGET_CERT_REVOCATION_MODE="online"
        export NUGET_PERSIST_DG="false"
        export NUGET_RESTORE_MSBUILD_VERBOSITY="normal"
        export NUGET_SHOW_STACK="true"
        export NUGET_XMLDOC_MODE="skip"
    fi
fi
