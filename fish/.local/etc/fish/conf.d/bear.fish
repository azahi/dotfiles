if command -s bear &>/dev/null
    set alts
    set -a remake
    set -a make

    for i in $alts
        if command -s $i &>/dev/null
            set bear_base="bear --include=./include --include=../include $i"
            if command -s nproc &>/dev/null
                alias m "$bear_base --jobs=(math (nproc) + 1)"
            else
                alias m "$bear_base"
            end
            set -e bear_base

            alias mc "m clean"

            break
        end
    end
    set -e alts
end
