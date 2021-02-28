if command -s beet &>/dev/null
    set -x BEETSDIR $XDG_DATA_HOME/beets

    set beets_config $XDG_CONFIG_HOME/beets/config.yaml
    if test -e $beets_config
        alias beet "beet -c $beets_config"
    end
    set -e beets_config
end
