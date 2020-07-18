setlocal foldmethod=syntax

if b:current_syntax ==? "c"
    setlocal syntax=c.doxygen
endif
