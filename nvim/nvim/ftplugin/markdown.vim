setlocal syntax=markdown

" Spellcheck in markdown (automatic to english)
setlocal spelllang=en
setlocal spell

" Auto-capitalize script
augroup SENTENCES
    au!
    autocmd InsertCharPre * if &ft=='markdown' | if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif | endif
augroup END

let g:markdown_folding=1

" Syncronize syntax from the beginning of the file
:syntax sync fromstart
