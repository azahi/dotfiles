set confirm off
set verbose off

set history expansion on

set height 0
set width  0

set output-radix 0x10

handle SIGALRM nostop print nopass
handle SIGBUS    stop print nopass
handle SIGPIPE nostop print nopass
handle SIGSEGV   stop print nopass

set python print-stack full

set print elements 0
set print pretty on
set print object on
set print static-members on
set print vtbl on

set demangle-style gnu-v3

set disassembly-flavor intel

alias iv=info variables

alias da=disassemble

define fs
    finish
    step
end
