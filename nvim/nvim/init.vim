" Vundle stuff ----------------------------------------------
set nocompatible
filetype off
set rtp+=$XDG_CONFIG_HOME/nvim/bundle/Vundle.vim
call vundle#begin($XDG_CONFIG_HOME . '/nvim/bundle/')

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
set list lcs=trail:·,tab:»·

" Clear trailing spaces on <F2>
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
nnoremap <F2> :call TrimWhiteSpace()<CR>

" Fold
set foldmethod=indent
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

" Enable TRUE COLORS
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Set default colorscheme but dark comments -> Torte
colorscheme torte

" Default tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
set autoindent

" Change buffers without needing to save
set hidden

" Explore configured to show tree
let g:netrw_liststyle= 3
