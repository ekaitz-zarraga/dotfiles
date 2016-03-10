setlocal syntax=markdown

" Spellcheck in markdown (automatic to english)
setlocal spelllang=en
setlocal spell

" Textwidth for automatic wrap `gq` is formatting operation
setlocal textwidth=79
setlocal formatoptions+=t


" Highlight where the lines are more than 80 characters wide
setlocal colorcolumn=80
highlight ColorColumn ctermbg=LightGreen

" Auto-capitalize script
augroup SENTENCES
	au!
	autocmd InsertCharPre * if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
augroup END
