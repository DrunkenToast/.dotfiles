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
            -- Set up mdx
            vim.filetype.add({ extension = { mdx = 'mdx' } })
            local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
            ft_to_parser.mdx = "markdown"

            -- Treesitter context
            require('treesitter-context').setup({})

            local opt = vim.opt

            opt.foldmethod = "expr"
            opt.foldexpr = "nvim_treesitter#foldexpr()"
            -- opt.foldenable = false
            -- opt.foldlevel = 999

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
                context_commentstring = {
                    enable = true,
                    -- enable_autocmd = false,
                },
            }
        end
    },
}
