return {
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            hint_enable = false,
        },
        config = function(_, opts)
            require('lsp_signature').setup(opts)
        end
    },
    {
        url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = { "LspAttach" },
        keys = {
            {

                "<leader>tl",
                function()
                    require('lsp_lines').toggle()
                    vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
                end,
                desc = "Toggle LSP lines",
                noremap = true,
                silent = true
            }
        },
        config = function()
            require("lsp_lines").setup()
        end,
    },
    {
        "aznhe21/actions-preview.nvim",
        keys = {
            {
                '<leader>ca',
                function()
                    require("actions-preview").code_actions()
                end,
                desc = 'Open code action menu',
                noremap = true,
                silent = true
            }
        },
    },
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
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        },
    },
}
