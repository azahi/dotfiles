set doom_bin $HOME/.emacs.d/bin

if test -x $doom_bin/doom
    set -a PATH $doom_bin
end

set -e doom_bin
