return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- adds pictograms to lsp
            { "onsails/lspkind-nvim" },
            -- Rust tools
            { 'simrat39/rust-tools.nvim' },

            -- Signature completion
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
        },
        config = function()
            -- If you want icons for diagnostic errors, you'll need to define them somewhere:
            vim.fn.sign_define("DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint",
                { text = "", texthl = "DiagnosticSignHint" })

            local lsp = require('lsp-zero')
            local lspkind = require('lspkind')
            local cmp = require('cmp')

            lsp.preset('recommended')

            lsp.ensure_installed({
                'tsserver',
                'rust_analyzer',
                'lua_ls',
                'marksman',
            })

            vim.fn.setenv('GDScript_Port', 6005)
            lsp.configure('gdscript', { force_setup = true })

            local rust_lsp = lsp.build_options('rust_analyzer', {})

            lsp.setup()

            local cmp_config = lsp.defaults.cmp_config({
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                        menu = "",
                    })
                },
            })

            table.insert(cmp_config.sources, { name = 'nvim_lsp_signature_help' });

            cmp.setup(cmp_config)

            vim.diagnostic.config({
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                virtual_lines = false,
            })

            lsp.on_attach(
                function(client, bufnr)
                    local opts = { remap = false, silent = true, buffer = bufnr }
                    -- Enable completion triggered by <c-x><c-o>
                    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
                    -- vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>bf', function() vim.lsp.buf.format { async = true } end, opts)
                    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

                    vim.keymap.set('n', 'gr', '<cmd>TroubleToggle lsp_references<cr>', { buffer = bufnr })
                    vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga rename<cr>', opts)
                    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)

                    vim.keymap.set('n', '<space>tl', function()
                        require('lsp_lines').toggle()
                        vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
                    end, opts)
                end
            )

            require('rust-tools').setup({ server = rust_lsp })

            require("luasnip.loaders.from_vscode").lazy_load({
                --paths = snippets_paths(),
                include = nil, -- Load all languages
                exclude = {},
            })
        end
    },

    {
        "hrsh7th/cmp-cmdline", -- cmdline completions
        event = "CmdlineEnter",
        config = function()
            local cmp = require 'cmp'
            cmp.setup.cmdline('/', {
                completion = {
                    completeopt = 'menu,menuone,noinsert,noselect'
                },
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                completion = {
                    completeopt = 'menu,menuone,noinsert,noselect'

                },
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }

                }, {
                    { name = 'cmdline' }
                })
            })
        end
    },

    -- lspsaga
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end,
        keys = {
            {
                '<leader>ca',
                '<cmd>Lspsaga code_action<cr>',
                desc = 'Open code action menu',
                noremap = true,
                silent = true
            }
        },
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        },
    },

    -- LSP lines
    {
        url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("lsp_lines").setup()
        end,
    },

    {
        lazy = false,
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>xx",
                '<CMD>TroubleToggle<CR>',
                desc = "Toggle Trouble. Diagnostics, references, quickfix and location lists.",
                noremap = true,
                silent = true
            },
            {
                "<leader>xw",
                '<CMD>TroubleToggle workspace_diagnostics<CR>',
                desc = "Toggle Trouble. Workspace LSP diagnostics.",
                noremap = true,
                silent = true
            },
            {
                "<leader>xd",
                '<CMD>TroubleToggle document_diagnostics<CR>',
                desc = "Toggle Trouble. Document LSP diagnostics.",
                noremap = true,
                silent = true
            },
            {
                "<leader>xq",
                '<CMD>TroubleToggle quickfix<CR>',
                desc = "Toggle Trouble. Quickfix.",
                noremap = true,
                silent = true
            },
            {
                "gr",
                '<CMD>TroubleToggle<CR>',
                desc = "Toggle Trouble. LSP references.",
                noremap = true,
                silent = true
            },
        }
    }
}
