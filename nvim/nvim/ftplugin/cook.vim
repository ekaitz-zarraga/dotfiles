" Spellcheck in cooklang (automatic to english)
setlocal spelllang=en
setlocal spell
setlocal formatoptions+=t

" Auto-capitalize script
augroup SENTENCES
    au!
    autocmd InsertCharPre * if &ft=='markdown' | if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif | endif
augroup END
