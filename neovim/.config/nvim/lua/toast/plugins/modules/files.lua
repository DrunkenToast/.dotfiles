return {
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "\\", "<cmd>lua require('oil').toggle_float()<cr>", desc = "oil - File tree explorer" },
        },
        config = function()
            require("oil").setup({
                keymaps = {
                    ["?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = "actions.select_vsplit",
                    ["<C-h>"] = "actions.select_split",
                    ["<C-t>"] = "actions.select_tab",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["<C-l>"] = "actions.refresh",
                    ["<BS>"] = "actions.parent",
                    ["-"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["."] = "actions.tcd",
                    ["H"] = "actions.toggle_hidden",
                },

            })
        end
    },
}
