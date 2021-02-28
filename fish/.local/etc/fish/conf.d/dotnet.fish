if command -s dotnet &>/dev/null
    set -a PATH $HOME/.dotnet/tools

    set -x DOTNET_CLI_TELEMETRY_OPTOUT 1
    set -x DOTNET_SKIP_FIRST_TIME_EXPERIENCE 1

    if command -s nuget &>/dev/null
        set -x NUGET_CERT_REVOCATION_MODE online
        set -x NUGET_PERSIST_DG false
        set -x NUGET_RESTORE_MSBUILD_VERBOSITY normal
        set -x NUGET_SHOW_STACK true
        set -x NUGET_XMLDOC_MODE skip
    end
end
