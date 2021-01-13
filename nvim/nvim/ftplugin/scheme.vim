" Use λ easier
inoremap <c-l> λ
syn keyword schemeSyntax λ

setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2
setlocal autoindent
setlocal lisp
setlocal showmatch

" Syncronize syntax from the beginning of the file
:syntax sync fromstart
