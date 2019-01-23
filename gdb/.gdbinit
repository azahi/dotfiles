set $64BITS = 1

set confirm on
set verbose on
set prompt \033[31mgdb \033[36m$ \033[0m

set output-radix 0x10
set input-radix 0x10

set height 0
set width 0

set disassembly-flavor intel

set $SHOW_CONTEXT   = 1
set $SHOW_NEST_INSN = 0

set $CONTEXTSIZE_CODE  = 8
set $CONTEXTSIZE_DATA  = 8
set $CONTEXTSIZE_STACK = 6

set $SHOWCPUREGISTERS = 1
set $SHOWDATAWIN      = 0
set $SHOWOBJECTIVEC   = 1
set $SHOWSTACK        = 0
