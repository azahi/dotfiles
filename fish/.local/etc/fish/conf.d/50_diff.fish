set alts
set -a alts batdiff
set -a alts colordiff
set -a alts cwdiff
set -a alts wdiff
set -a alts diff

for i in $alts
    if command -s $i &>/dev/null
        set -x DIFF $i
        alias d $i
        break
    end
end

set -e alts
