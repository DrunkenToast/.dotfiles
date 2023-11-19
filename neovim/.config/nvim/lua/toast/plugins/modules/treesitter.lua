return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPost", "BufNewFile" },
        build = ':TSUpdate',
        dependencies = {
            {
                'JoosepAlviste/nvim-ts-context-commentstring',
                'nvim-treesitter/nvim-treesitter-context',
            }
        },
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            require('ts_context_commentstring').setup {}

            -- Set up mdx
            vim.filetype.add({ extension = { mdx = 'mdx' } })
            vim.treesitter.language.register('markdown', 'mdx')

            -- Treesitter context
            require('treesitter-context').setup({})

            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "markdown",
                    "markdown_inline"
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = { "c", "cpp" },
                    -- additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
            }
        end
    },
}
