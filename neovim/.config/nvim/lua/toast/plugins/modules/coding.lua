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
        opts = {
            check_ts = true,
        },
    },

    {
        "sindrets/diffview.nvim",
        event = { 'VeryLazy' },
        opts = {
            enhanced_diff_hl = true,
        }
    },

    {
        "stevearc/conform.nvim",
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            -- TODO: change <leader>bf to use conform if available and
            -- fall back to lsp format
            -- TODO: Setup ESLINT
            -- TODO: Put back to prettierd
            local prettierConf = { "prettier", "prettierd", stop_after_first = true }
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "luaformatter" },
                    csharp = { "csharpier" },
                    cs = { "csharpier" },
                    -- sql = { "sql_formatter" },
                    javascript = prettierConf,
                    vue = prettierConf,
                    typescript = prettierConf,
                    typescriptreact = prettierConf,
                    astro = prettierConf,
                    json = prettierConf,
                    html = prettierConf,
                    css = prettierConf,
                    scss = prettierConf,
                    sass = prettierConf,
                    gdscript = { "gdformat" },
                    nix = { "nixpkgs-fmt" },
                    -- dart = { "dart_format" },
                    -- markdown = { "prettierd", "prettier" },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    -- filter = function(client)
                    --     -- for i, v in ipairs(client) do print(i, v) end
                    --     -- local ignore_filetypes = { "sql" }
                    --     -- if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    --     --     return false
                    --     -- end
                    --     -- return true
                    -- end,
                    timeout_ms = 500,
                    lsp_fallback = true,
                    quiet = true,
                },
                formatters = {
                    ["nixpkgs-fmt"] = {
                        command = "nixpkgs-fmt",
                        prepend_args = {}
                    }
                }
            })


            -- Format command
            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_fallback = true, range = range })
            end, { range = true })
        end
    },

    -- TODO highlighting and browsing
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
        },
        cmd = { "TodoTrouble", "TodoTelescope" },
        -- NOTE: https://github.com/LazyVim/LazyVim/discussions/1583
        event = "VeryLazy",
        opts = {
            highlight = {
                pattern = [[.*<(KEYWORDS)\s*[:@]\s*]] -- vim regex
            },
            search = {
                -- Matches with "TODO: something" and "TODO @PL something"
                pattern = [[\b(KEYWORDS)(:?:|\s+@\w+)]], -- ripgrep regex
            }
        },
        keys = {
            {
                "<leader>xt",
                '<CMD>Trouble todo toggle<CR>',
                desc = "Open todos in Trouble",
                noremap = true,
                silent = true
            },
        },
    }
}
