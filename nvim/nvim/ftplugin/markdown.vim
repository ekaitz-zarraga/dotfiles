setlocal syntax=markdown

" Spellcheck in markdown (automatic to english)
setlocal spelllang=en
setlocal spell

" Textwidth for automatic wrap `gq` is formatting operation
setlocal textwidth=79
setlocal formatoptions+=t
setlocal formatoptions-=l


" Highlight where the lines are more than 80 characters wide
setlocal colorcolumn=80
highlight ColorColumn ctermbg=DarkGrey

" Auto-capitalize script
augroup SENTENCES
    au!
    autocmd InsertCharPre * if &ft=='markdown' | if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif | endif
augroup END

" Highlight spelling errors in red and underline
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=Red

" Tabs to 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2
set autoindent
