return {
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>xx",
                '<CMD>TroubleToggle<CR>',
                desc = "Toggle Trouble",
                noremap = true,
                silent = true
            },
            {
                "<leader>xw",
                '<CMD>Trouble workspace_diagnostics<CR>',
                desc = "Trouble. Workspace LSP diagnostics.",
                noremap = true,
                silent = true
            },
            {
                "<leader>xd",
                '<CMD>Trouble document_diagnostics<CR>',
                desc = "Trouble. Document LSP diagnostics.",
                noremap = true,
                silent = true
            },
            {
                "<leader>xq",
                '<CMD>Trouble quickfix<CR>',
                desc = "Trouble. Quickfix.",
                noremap = true,
                silent = true
            },
            {
                "gr",
                '<CMD>Trouble<CR>',
                desc = "Trouble. LSP references.",
                noremap = true,
                silent = true
            },
        }
    }
}
