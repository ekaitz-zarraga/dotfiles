vim.opt.compatible = false
vim.cmd.filetype("off")

-- Plugins
local Plug = vim.fn['plug#']
vim.fn["plug#begin"]()
    Plug("nvim-treesitter/nvim-treesitter")
    Plug("kovisoft/paredit")
    Plug("sgur/vim-editorconfig")
    Plug("dracula/vim")
    Plug("othree/html5.vim")
    Plug("zaid/vim-rec")
    Plug("https://gitlab.com/Efraim/guix.vim")
    Plug("Olical/conjure")
    vim.g["conjure#client_on_load"] = false
    vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
    vim.g["conjure#debug"] = true
    vim.g.maplocalleader = ","
    -- Zig is installed in nvim
    vim.g.zig_fmt_autosave = 0
vim.fn["plug#end"]()

vim.cmd.filetype("plugin", "on")

-- Syntax
vim.cmd.syntax("on")
vim.cmd.syntax("sync", "fromstart")
vim.opt.redrawtime = 10000

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
vim.cmd.colorscheme("dracula")
vim.opt.cursorline = true
vim.cmd.highlight("CursorColumn", "ctermbg=DarkGrey", "guibg=#262626")
vim.cmd.highlight("CursorLine", "ctermbg=DarkGrey", "guibg=#262626")

vim.opt.colorcolumn = "80"
vim.cmd.highlight("ColorColumn", "ctermbg=DarkGrey", "guibg=#262626")

vim.cmd.highlight("ExtraWhitespace", "ctermbg=red", "guibg=red")

-- HighLight search
vim.opt.hlsearch = true

-- Whitespace
local extraWhitespace = vim.api.nvim_create_augroup('whitespace', { clear = false })
vim.api.nvim_create_autocmd({"WinNew", "TabNew", "BufEnter", "InsertLeave"}, {
    group = extraWhitespace,
    pattern = {"*"},
    command = "match ExtraWhitespace  /\\s\\+$/",
})
vim.api.nvim_create_autocmd({"InsertEnter"}, {
    group = extraWhitespace,
    pattern = {"*"},
    command = "call clearmatches()",
})

vim.opt.list = true
vim.opt.listchars = {trail="·", tab="»·"}

-- UI
vim.opt.showtabline = 1
vim.opt.wildmenu = true
vim.opt.mouse = "a"
vim.opt.showmatch = true
vim.opt.modeline = true
vim.opt.path = {"**"}

-- Ignore Case in search
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- New splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Netrw
vim.g.netrw_liststyle    = 1
vim.g.netrw_banner       = 1
vim.g.netrw_winsize      = 75

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

-- Autocomplete
vim.opt.complete = {".", "w", "b", "u", "t", "i"}

-- Edition
vim.opt.hidden = true
vim.opt.undofile = true

-- Tabs
vim.opt.tabstop=4
vim.opt.softtabstop=0
vim.opt.expandtab = true
vim.opt.shiftwidth=4

-- Formatting
vim.opt.textwidth=79
vim.opt.formatoptions="jcroql"

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


if vim.fn.executable("rg") then
    vim.opt.grepprg="rg --vimgrep --no-heading"
    vim.opt.grepformat="%f:%l:%c:%m,%f:%l:%m"
end

-- Mappings
require("mappings")
