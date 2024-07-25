return {
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        opts =
        {
            focus = true,
            pinned = true,
            preview = {
                type = "split",
                relative = "win",
                position = "right",
                size = 0.3,
            },
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            -- Trouble with TODO
            "folke/todo-comments.nvim",
        },
        keys = {
            {
                "<leader>xw",
                '<CMD>Trouble diagnostics toggle<CR>',
                desc = "Trouble. Workspace LSP diagnostics.",
                noremap = true,
                silent = true
            },
            {
                "<leader>xd",
                '<CMD>Trouble diagnostics toggle filter.buf=0<CR>',
                desc = "Trouble. Document/buffer LSP diagnostics.",
                noremap = true,
                silent = true
            },
            {
                "<leader>xq",
                '<CMD>Trouble qflist toggle<CR>',
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
