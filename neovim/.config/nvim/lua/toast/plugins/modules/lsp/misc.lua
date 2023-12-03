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
}
