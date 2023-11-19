return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
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
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'saadparwaiz1/cmp_luasnip' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- adds pictograms to lsp
            { "onsails/lspkind-nvim" },
            -- Rust tools
            { 'simrat39/rust-tools.nvim' },

            -- -- For certain keybinds
            -- { "glepnir/lspsaga.nvim" },
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

            local lsp_zero = require('lsp-zero')
            local lsp_kind = require('lspkind')
            local cmp = require('cmp')

            lsp_zero.preset('recommended')

            require('mason').setup({}) -- TODO check this
            require('mason-lspconfig').setup({
                ensure_installed =
                {
                    'tsserver',
                    'rust_analyzer',
                    'lua_ls',
                    'marksman',
                },
                handlers = {
                    lsp_zero.default_setup,
                    rust_analyzer = function()
                        local rt = require('rust-tools')
                        rt.setup({
                            server = {
                                on_attach = function(_, bufnr)
                                    vim.keymap.set('n', 'K', rt.hover_actions.hover_actions,
                                        { buffer = bufnr })
                                end
                            }
                        })
                    end
                },
            })

            -- Godot
            vim.fn.setenv('GDScript_Port', 6005)
            lsp_zero.configure('gdscript', { force_setup = true })

            local cmp_config = lsp_zero.defaults.cmp_config({
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                },
                formatting = {
                    format = lsp_kind.cmp_format({
                        mode = 'symbol',
                        menu = "",
                    })
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' }, -- nvim-cmp source for neovim Lua API
                    { name = "buffer" },
                    { name = "path" },
                    { name = "crates" }, -- For rust crates
                }
            })

            cmp.setup(cmp_config)

            vim.diagnostic.config({
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                virtual_lines = false,
            })

            lsp_zero.on_attach(
                function(client, bufnr)
                    lsp_zero.default_keymaps({ buffer = bufnr })
                    local opts = { remap = false, silent = true, buffer = bufnr }
                    -- Enable completion triggered by <c-x><c-o>
                    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
                    -- vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>bf', function() vim.lsp.buf.format { async = true } end, opts)
                    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

                    vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<cr>', { buffer = bufnr })
                    vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga rename<cr>', opts)
                    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
                end
            )

            lsp_zero.setup()

            require("luasnip.loaders.from_vscode").lazy_load({
                --paths = snippets_paths(),
                include = nil, -- Load all languages
                exclude = {},
            })
        end
    },
}
