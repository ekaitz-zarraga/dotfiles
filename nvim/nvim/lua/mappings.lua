-- These functions are shit at the moment: they screw up the search list
function trimWhiteSpace()
    vim.cmd("%s/\\s\\+$//")
end
function trimWhiteSpaceVisual()
    vim.cmd("'<,'>s/\\s\\+$//")
end
vim.keymap.set('n', '<F2>', trimWhiteSpace)
vim.keymap.set('v', '<F2>', trimWhiteSpaceVisual)

-- more natural movement with wrap on
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.api.nvim_create_user_command('MakeTags', '!ctags -R .', {})
vim.api.nvim_create_user_command('Sgrep', 'silent grep! <args> | copen 10', {nargs= '+'})
