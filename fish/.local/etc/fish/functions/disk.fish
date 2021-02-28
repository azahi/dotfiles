if command -v df &>/dev/null
    function disk -w df
        df --human-readable --exclude-type=tmpfs --exclude-type=devtmpfs $argv
    end
end
