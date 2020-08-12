# sh -c "$(curl -fsSL http://gef.blah.cat/sh)"
source ~/.gdbinit-gef.py

set history expansion on

set height 0
set width  0

handle SIGALRM nostop print nopass
handle SIGBUS    stop print nopass
handle SIGPIPE nostop print nopass
handle SIGSEGV   stop print nopass

set python print-stack full

set print pretty on
set print object on
set print static-members on
set print vtbl on

set demangle-style gnu-v3

alias iv=info variables

alias da=disassemble

define fs
    finish
    step
end
