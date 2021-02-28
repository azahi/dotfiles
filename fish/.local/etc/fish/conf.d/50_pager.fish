set alts
set -a alts
set -a alts slit
set -a alts moar
set -a alts most
set -a alts less
set -a alts more
set -a alts cat

for i in $alts
    if command -s $i &>/dev/null
        set -x PAGER $i
        alias p $i
        break
    end
end

set -e alts
