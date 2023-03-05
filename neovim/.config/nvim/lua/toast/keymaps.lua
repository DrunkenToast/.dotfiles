-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set({'!'}, 'jk', [[<c-\><c-n>]], {
--     desc = 'Exit to normal mode',
--     noremap = true, silent = true
-- })

vim.keymap.set({'v'}, '<C-C>', [["+y]], {
    desc = 'Copy to system clipboard',
    noremap = true, silent = true
})

