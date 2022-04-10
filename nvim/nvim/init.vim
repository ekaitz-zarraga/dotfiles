" VUNDLE:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
call vundle#begin($HOME . '/.config/nvim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Post to Wordpress using MarkDown
Plugin 'ekaitz-zarraga/droWMark'

" CoffeeScript stuff
" Plugin 'kchmck/vim-coffee-script'

" Paredit for Clojure and Lisp
Plugin 'vim-scripts/paredit.vim'
" Clojure REPL integration
Plugin 'tpope/vim-fireplace'

" Syntax highlighting for Rust
Plugin 'wting/rust.vim'

" Write with no distractions
Plugin 'junegunn/goyo.vim'

" .editorconfig file support
Plugin 'sgur/vim-editorconfig'

" Dracula colorscheme
Plugin 'dracula/vim'

" HTML5
Plugin 'othree/html5.vim'

" Russian keyboard support
Plugin 'powerman/vim-plugin-ruscmd.git'

" Recutils support
Plugin 'zaid/vim-rec'

" Guix
Plugin 'https://gitlab.com/Efraim/guix.vim'

" Repl
Plugin 'https://gitlab.com/HiPhish/repl.nvim.git'

" Common-Lisp
" Plugin 'vlime/vlime', {'rtp': 'vim/'}

" Combustion-testing
" Plugin 'git@gitlab.com:ElenQ/combustion.git'

" Add plugins here

call vundle#end()            " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" GUI:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Activate syntax highlighting by default
syntax on

" Keep 10 lines of space from the cursor to the window corners
" I don't like this, prefer to use zz
" set scrolloff=10

" Show completion in a menu
set wildmenu

" Enable TRUE COLORS
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors
set background=dark

" Set default colorscheme
" colorscheme desert
colorscheme dracula

" Highligh column and line
" set cursorcolumn
set cursorline
highlight CursorColumn ctermbg=DarkGrey guibg=#262626
highlight CursorLine ctermbg=DarkGrey guibg=#262626
highlight! link CursorColumn CursorLine

" Show trailing spaces
set list lcs=trail:·,tab:»·

" Always show tabline (0=never, 1=when there are at least 2 tabs, 2=always)
set showtabline=1

" Split on the right in vertical and below in horizontal
set splitbelow
set splitright

" Explore configured to show tree
" Use a banner
" always open files in previous window
let g:netrw_liststyle    = 1
let g:netrw_banner       = 1
let g:netrw_winsize      = 75 " % of window by v or o operation

" Mouse support
set mouse=a

" Fold
set foldmethod=indent
set foldlevelstart=99
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EDITION:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
set complete=.,w,b,u,t,i,kspell

" Allow backspace always
set backspace=indent,eol,start

" Change buffers without needing to save
set hidden

" Maintain undo history between sessions
set undofile

" Clear trailing spaces on <F2>
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
function TrimWhiteSpaceVisual()
  '<,'>s/\s*$//
  ''
:endfunction
" Whitexpace trimmer available in normal and edit mode
nnoremap <F2> :call TrimWhiteSpace()<CR>
inoremap <F2> <ESC>:call TrimWhiteSpace()<CR>
vnoremap <F2> :call TrimWhiteSpaceVisual()<CR>

" Scissors
" TODO: improve this
function AddScissors()
    execute "normal i--8<---------------cut here---------------start------------->8---\n"
    execute "normal i--8<---------------cut here---------------end--------------->8---\n"
:endfunction
command! Scissors execute 'call AddScissors()'

" Default tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
set autoindent

" Show matching parenthesis and brackets on close
set showmatch

" Disable modelines (they have vulnerabilities)
set nomodeline

" Allow saving of files as sudo
" TODO LOOK FOR A BETTER WAY TO DO THIS
" cmap w!! w !sudo tee > /dev/null %

" SEARCH

" Search through files in the current tree (like :find)
set path+=**

" Make ctags so we can search with ^] and g^] and ^t
command! MakeTags !ctags -R .

" Use ripgrep as search tool
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

command! -nargs=+ Sgrep execute 'silent grep! <args>' | copen 10

" HighLight search
set hlsearch

" Ignore Case in search
set ignorecase
set smartcase


" TEXT WIDTH

" Textwidth for automatic wrap, `gq` is formatting operation
set textwidth=79
set formatoptions=jcroql

" Highlight where the lines are more than 80 characters wide
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGrey guibg=#262626

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TERMINAL:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make terminal remap to go out of insert mode
:tnoremap <F1> <C-\><C-n>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" REPL: repl.vim:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Send the text of a motion to the REPL
nmap <leader>rs  <Plug>(ReplSend)
" Send the current line to the REPL
nmap <leader>rss <Plug>(ReplSendLine)
nmap <leader>rs_ <Plug>(ReplSendLine)
" Send the selected text to the REPL
vmap <leader>rs  <Plug>(ReplSend)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Different config for each filetype
filetype plugin on
