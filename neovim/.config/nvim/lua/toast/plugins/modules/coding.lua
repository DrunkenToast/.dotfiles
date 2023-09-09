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
        "nvimdev/guard.nvim",
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            local ft = require('guard.filetype')

            ft('typescript,javascript,typescriptreact,vue,html,astro,json'):fmt('prettierd')

            -- Call setup() LAST!
            require('guard').setup({
                -- the only options for the setup function
                fmt_on_save = true,
                -- Use lsp if no formatter was defined for this filetype
                lsp_as_default_formatter = false,
            })
        end
    },
}
