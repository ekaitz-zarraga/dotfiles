" Spellcheck in markdown (automatic to english)
setlocal spelllang=es
setlocal spell

" Automatic text-wrap
setlocal formatoptions+=t
setlocal formatoptions-=l


" Auto-capitalize script
augroup SENTENCES
    au!
    autocmd InsertCharPre * if &ft=='drowmark' | if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif | endif
augroup END

" Tabs to 2 spaces
setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2
setlocal autoindent
