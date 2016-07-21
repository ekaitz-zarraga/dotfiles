setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2
setlocal autoindent

" Test some wrapping on the html
setlocal textwidth=79
setlocal formatoptions+=t

" Highlight where the lines are more than 80 characters wide
setlocal colorcolumn=80
highlight ColorColumn ctermbg=LightGreen

setlocal foldmethod=indent
