
" Vundle stuff ----------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Post to Wordpress using MarkDown
Plugin 'ekaitz-zarraga/droWMark'

" Add plugins here

call vundle#end()            " required
" / Vundle stuff end ----------------------------------------

" Allow backspace always
set backspace=indent,eol,start

" Activate syntax highlighting by default
syntax on

" Different config for each filetype
filetype plugin on

" Show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red


" Clear trailing spaces on <F2>
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
nnoremap <F2> :call TrimWhiteSpace()<CR>

" Fold
set foldmethod=syntax
set foldlevelstart=99

" HighLight search and map CarrierReturn to remove highlight
set hlsearch
nnoremap <CR> :noh<CR><CR>

" Ignore Case in search
set ignorecase
set smartcase

" Always show tabline (0=never, 1=when there are at least 2 tabs, 2=always)
set showtabline=1

" Mouse support
set mouse=a

" Set default colorscheme but dark comments -> Torte
colorscheme torte

" Default tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
set autoindent
