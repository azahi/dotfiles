set alts
set -a alts nvim
set -a alts vim
set -a alts vi
set -a alts nano
set -a alts ed

for i in $alts
    if command -s $i &>/dev/null
        set -x EDITOR $i
        alias e $i
        break
    end
end

set -e alts
