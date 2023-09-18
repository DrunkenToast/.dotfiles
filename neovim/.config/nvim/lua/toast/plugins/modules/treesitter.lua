return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPost", "BufNewFile" },
        build = ':TSUpdate',
        dependencies = {
            {
                'JoosepAlviste/nvim-ts-context-commentstring',
            }
        },
        config = function()
            local opt = vim.opt

            opt.foldmethod = "expr"
            opt.foldexpr = "nvim_treesitter#foldexpr()"
            opt.foldenable = false
            opt.foldlevel = 999

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
    }
}
