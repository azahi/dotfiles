set alts
set -a alts qutebrowser
set -a alts librewolf
set -a alts firefox
set -a alts chromium
set -a alts chromium-browser
set -a alts surf
set -a alts w3m
set -a alts lynx
set -a alts elinks
set -a alts links

for i in $alts
    if command -s $i &>/dev/null
        set -x BROWSER $i
        alias b $i
        break
    end
end

set -e alts
