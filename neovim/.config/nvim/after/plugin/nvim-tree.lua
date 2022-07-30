require("nvim-tree").setup()

vim.keymap.set({'n'}, '<leader>v', '<CMD>NvimTreeToggle<CR>', {
    desc = 'Toggle nvim tree file explorer',
    noremap = true, silent = true
})
