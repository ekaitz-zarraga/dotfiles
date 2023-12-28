" Vim Plug:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

call plug#begin()

" Better syntax highlighting with treesitter
Plug 'nvim-treesitter/nvim-treesitter' ", {'do': ':TSUpdate'}

" Post to Wordpress using MarkDown
" Plug 'ekaitz-zarraga/droWMark'

" CoffeeScript stuff
" Plug 'kchmck/vim-coffee-script'

" Paredit for Clojure and Lisp
" Plug 'vim-scripts/paredit.vim'
Plug 'kovisoft/paredit'

" Clojure REPL integration ---> Conjure does this and more
" Plug 'tpope/vim-fireplace'

" Write with no distractions
Plug 'junegunn/goyo.vim'

" .editorconfig file support
Plug 'sgur/vim-editorconfig'

" Dracula colorscheme
Plug 'dracula/vim'

" HTML5
Plug 'othree/html5.vim'

" Recutils support
Plug 'zaid/vim-rec'

" Guix
Plug 'https://gitlab.com/Efraim/guix.vim'

" Conjure: lispy things! this is what I wanted to do with combustion!
Plug 'Olical/conjure'
let g:conjure#client_on_load = v:false
let g:conjure#filetype#scheme = "conjure.client.guile.socket"
let g:conjure#debug = v:true
let g:maplocalleader = ","


" Repl
" Plug 'https://gitlab.com/HiPhish/repl.nvim.git'

" Combustion-testing
" Plug 'git@gitlab.com:ElenQ/combustion.git'

" Add plugins here

call plug#end()            " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" GUI:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Activate syntax highlighting by default and make it almost work properly
syntax on
syntax sync fromstart
set redrawtime=10000
" Maybe with tree-sitter we don't need this anymore
nnoremap <F5> :syntax sync fromstart<CR>

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
" set foldmethod=indent
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EDITION:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
set complete=.,w,b,u,t,i

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

" Enable modelines (they have vulnerabilities, but it should be fine LOL)
set modeline

" Allow saving of files as sudo
" TODO LOOK FOR A BETTER WAY TO DO THIS
" cmap w!! w !sudo tee > /dev/null %

" SEARCH

" Search through files in the current tree (like :find)
set path+=**

" Ignore .go files (guile object)
set wildignore+=*.go

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

" Different config for each filetype
filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace: highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * call clearmatches()
autocmd BufWinLeave * call clearmatches()


" Configure Treesitter
lua << ENDMARK
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "python", "scheme", "javascript",
    "fennel", "zig" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
ENDMARK
" Redraw the syntax if the tree and the file went out of sync
" nnoremap <F6> :write | edit | TSBufEnable highlight
au FileType fennel call PareditInitBuffer()
