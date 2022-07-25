-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- jk to Escape 
vim.keymap.set({'!'}, 'jk', [[<c-\><c-n>]], {})

-- vim.keymap.set({'v'}, '<C-c>', [["+y]], {})
