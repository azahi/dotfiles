if command -s ccache &>/dev/null
    set -x CCACHE_DIR $HOME/.ccache

    set ccache_bin "/usr/lib/ccache/bin"
    if test -d $ccache_bin
        set -x CCACHE_PATH $ccache_bin:$PATH
    else
        set -x CCACHE_PATH $PATH
    end
    set -e ccache_bin
end
