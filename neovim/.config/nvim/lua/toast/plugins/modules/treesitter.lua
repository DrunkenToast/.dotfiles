return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile" },
        build = ':TSUpdate',
        dependencies = {
            {
                "p00f/nvim-ts-rainbow"
            }
        },
        config = function()
            local opt = vim.opt

            opt.foldmethod = "expr"
            opt.foldexpr = "nvim_treesitter#foldexpr()"
            opt.foldenable = false
            opt.foldlevel = 999

            require("nvim-treesitter.configs").setup {
                -- ensure_installed = {
                --     "bash",
                --     "c",
                --     "html",
                --     "javascript",
                --     "json",
                --     "lua",
                --     "luadoc",
                --     "luap",
                --     --Please make sure you install markdown and markdown_inline parser - lspsaga
                --     "markdown",
                --     "markdown_inline",
                --     "python",
                --     "query",
                --     "regex",
                --     "tsx",
                --     "typescript",
                --     "vim",
                --     "vimdoc",
                --     "yaml",
                --     "rust"
                -- },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                rainbow = {
                    enable = true,
                    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                    -- extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    -- max_file_lines = nil, -- Do not enable for files with more than n lines, int
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                },
            }
        end
    }
}
