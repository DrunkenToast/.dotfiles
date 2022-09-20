-- keymaps
vim.keymap.set({'n'}, '<F5>',":lua require'dap'.continue()<CR>", {
    desc = 'Debugger continue',
    noremap = true, silent = true
})
vim.keymap.set({'n'}, '<F10>',":lua require'dap'.step_over()<CR>", {
    desc = 'Debugger step over',
    noremap = true, silent = true
})
vim.keymap.set({'n'}, '<F11>',":lua require'dap'.step_into()<CR>", {
    desc = 'Debugger step into',
    noremap = true, silent = true
})
vim.keymap.set({'n'}, '<F12>',":lua require'dap'.step_out()<CR>", {
    desc = 'Debugger step out',
    noremap = true, silent = true
})

vim.keymap.set({'n'}, '<space>db',":lua require'dap'.toggle_breakpoint()<CR>", {
    desc = 'Debugger toggle breakpoint',
    noremap = true, silent = true
})
vim.keymap.set({'n'}, '<space>dB',":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {
    desc = 'Debugger set breakpoint condition',
    noremap = true, silent = true
})
vim.keymap.set({'n'}, '<space>dl',":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {
    desc = 'Debugger set log point message',
    noremap = true, silent = true
})
vim.keymap.set({'n'}, '<space>dr',":lua require'dap'.repl.open()<CR>", {
    desc = 'Debugger repl open',
    noremap = true, silent = true
})

vim.keymap.set({'n'}, '<space>do',":lua require'dapui'.toggle()<CR>", {
    desc = 'Debugger repl open',
    noremap = true, silent = true
})

require("dapui").setup()
require("nvim-dap-virtual-text").setup({})
