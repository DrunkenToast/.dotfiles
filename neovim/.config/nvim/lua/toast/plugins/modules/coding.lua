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
        config = function()
            require("nvim-autopairs").setup {
                check_ts = true,
            }
        end
    },
    -- {
    --     'weilbith/nvim-code-action-menu',
    --     cmd = 'CodeActionMenu',
    -- },
    {
        -- Basically only here to do prettier
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier.with({
                        extra_args = function(params)
                            return params.options
                                and params.options.tabSize
                                and {
                                    "--tab-width",
                                    params.options.tabSize,
                                }
                        end,
                    }),
                    -- null_ls.builtins.formatting.stylua,
                    -- null_ls.builtins.diagnostics.eslint,
                    -- null_ls.builtins.completion.spell,
                }
            })
        end
    },
}
