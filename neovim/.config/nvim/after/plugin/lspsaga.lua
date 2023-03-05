require('lspsaga').setup({})

-- vim.keymap.set({'n', 'v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', {
--     desc = 'Code action menu',
--     noremap = true, silent = true
-- })
-- vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', {
--     desc = 'LSP rename',
--     noremap = true, silent = true
-- })
-- vim.keymap.set('n', '<leader>pd', '<cmd>Lspsaga peek_definition<CR>', {
--     desc = 'LSP peek definition',
--     noremap = true, silent = true
-- })
-- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', {
--     desc = 'LSP hover documentation',
--     noremap = true, silent = true
-- })

vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>', {
    desc = 'LSOutlineToggle',
    noremap = true, silent = true
})

