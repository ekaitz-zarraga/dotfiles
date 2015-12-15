highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


filetype plugin on

" Fold
set foldmethod=syntax
set foldlevelstart=99



" HighLight search and map CarrierReturn to remove highlight
set hlsearch
nnoremap <CR> :noh<CR><CR>

" Understand .md as markdown
autocmd BufNewFile,BufRead *.md set ft=markdown
