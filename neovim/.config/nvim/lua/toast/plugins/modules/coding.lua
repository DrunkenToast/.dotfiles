return {
    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('Comment').setup()
        end
    },
    {
        "windwp/nvim-autopairs",
        event = { 'InsertEnter' },
        config = function()
            require("nvim-autopairs").setup {
                check_ts = true,
            }
        end
    },
    {
        "sindrets/diffview.nvim",
        event = { 'VeryLazy' },
        config = function()
            require('diffview').setup({
                enhanced_diff_hl = true,
            })
        end
    },
    {
        "stevearc/conform.nvim",
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            -- TODO change <leader>bf to use conform if available and
            -- fall back to lsp format
            -- TODO Setup ESLINT
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { { "prettierd", "prettier" } },
                    vue = { { "prettierd", "prettier" } },
                    typescript = { { "prettierd", "prettier" } },
                    typescriptreact = { { "prettierd", "prettier" } },
                    astro = { { "prettierd", "prettier" } },
                    json = { { "prettierd", "prettier" } },
                    html = { { "prettierd", "prettier" } },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end
    },
}
