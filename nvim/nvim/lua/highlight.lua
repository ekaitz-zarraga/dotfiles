local ns = vim.api.nvim_create_namespace("highlight")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- TODO:
-- https://medium.com/@ankochem/neovim-highlighting-the-text-programmatically-with-lua-837fecfa36d2
-- Highlight whatever the user selected
-- function highlight_selection()
--     local start  = vim.api.nvim_buf_get_mark(0, '[')
--     local finish = vim.api.nvim_buf_get_mark(0, ']')
--     start[1] = start[1] - 1
--     if start[1] < 0 then start[1] = 0 end
--     start[2] = start[2] + 1
--     finish[1] = finish[1] - 1
--     if finish[1] < 0 then finish[1] = 0 end
--     finish[2] = finish[2] + 1
--     vim.highlight.range(0, ns, "IncSearch", start, finish)
-- end
--
-- function clean_highlight()
--     vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
--     vim.cmd("redraw")
-- end
--
-- -- TODO
-- vim.keymap.set('n', '<C-h>', highlight_selection)
-- vim.keymap.set('n', '<C-l><C-l>', clean_highlight)
