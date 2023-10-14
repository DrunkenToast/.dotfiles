return {
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = {
                    enable = false
                }
            })
        end,
        keys = {
            {
                '<leader>ca',
                '<cmd>Lspsaga code_action<cr>',
                desc = 'Open code action menu',
                noremap = true,
                silent = true
            }
        },
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        },
    },
}
