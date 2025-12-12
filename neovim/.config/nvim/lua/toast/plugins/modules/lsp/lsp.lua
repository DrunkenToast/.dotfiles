return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        dependencies = {
            -- LSP Support
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

            -- { 'hrsh7th/cmp-nvim-lsp-signature-help' },

            { 'saadparwaiz1/cmp_luasnip' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- adds pictograms to lsp
            { "onsails/lspkind-nvim" },
            -- Rust tools
            { 'simrat39/rust-tools.nvim' },

            -- csharp omnisharp extension for textDocument/definition
            { "Hoffs/omnisharp-extended-lsp.nvim" },
            -- -- For certain keybinds
            { "glepnir/lspsaga.nvim" },
        },
        config = function()
            local sev = vim.diagnostic.severity
            vim.diagnostic.config {
                signs = {
                    text = {
                        [sev.ERROR] = "",
                        [sev.WARN] = "",
                        [sev.INFO] = "",
                        [sev.HINT] = "",
                    },
                    numhl = {
                        [sev.ERROR] = 'WarningMsg',
                    },
                },
                underline = true,
                update_in_insert = true,
                severity_sort = true,
                virtual_lines = false,
            }


            local lspkind = require('lspkind')
            local cmp = require('cmp')

            --- cmp {{{
            -- vim.lsp.config('*', {
            --     capabilities = lsp_capabilities,
            -- }
            -- )

            -- local lspconfig_defaults = util.default_config
            -- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            --     'force',
            --     lspconfig_defaults.capabilities,
            --     require('cmp_nvim_lsp').default_capabilities()
            -- )


            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),

                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol",
                        menu = "",
                    }),
                },

                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    -- { name = "nvim_lsp_signature_help" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "crates" },
                }),

                window = {
                    -- completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            })

            --- }}}

            --- Mason {{{
            require('mason').setup({}) -- TODO check this
            require('mason-lspconfig').setup({
                ensure_installed =
                {
                    -- 'ts_ls',
                    'rust_analyzer',
                    'lua_ls',
                    'marksman',
                    'vue_ls',
                    'vtsls',
                },
                -- handlers = {
                --     rust_analyzer = function()
                --         local rt = require('rust-tools')
                --         rt.setup({
                --             server = {
                --                 on_attach = function(_, bufnr)
                --                     vim.keymap.set('n', 'K', rt.hover_actions.hover_actions,
                --                         { buffer = bufnr })
                --                 end,
                --                 settings = {
                --                     ["rust-analyzer"] = {
                --                         cargo = {
                --                             allFeatures = true,
                --                         },
                --                         procMacro = {
                --                             ignored = {
                --                                 ['napi-derive'] = { 'napi' },
                --                             },
                --                         }
                --                     },
                --                 },
                --             },
                --         })
                --     end,
                --     omnisharp = function()
                --         -- vim.env.DOTNET_ROOT = '/usr/local/share/dotnet'
                --         -- vim.env.PATH = vim.env.PATH .. ':' .. vim.env.DOTNET_ROOT
                --         local pid = vim.fn.getpid()
                --
                --         require('lspconfig').omnisharp.setup({
                --             cmd_env = {
                --                 -- DOTNET_ROOT = '/usr/local/share/dotnet',
                --                 -- PATH = '/usr/local/share/dotnet' .. ':' .. vim.env.PATH,
                --             },
                --             cmd = { "omnisharp", '--languageserver', '--hostPID', tostring(pid) },
                --             handlers = {
                --                 ["textDocument/definition"] = require('omnisharp_extended').handler,
                --             },
                --         })
                --     end,
                --     -- vue_ls = function()
                --     -- end,
                -- },
            })
            --}}}

            vim.lsp.enable('tailwindcss')

            -- Vue & TypeScript {{{
            local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
                '/vue-language-server' .. '/node_modules/@vue/language-server'

            local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

            local vue_plugin = {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
                configNamespace = 'typescript',
            }

            local vtsls_config = {
                settings = {
                    vtsls = {
                        tsserver = {
                            globalPlugins = {
                                vue_plugin,
                            },
                        },
                    },
                },
                filetypes = tsserver_filetypes,
                on_attach = function()
                    vim.lsp.enable({ 'vue_ls' })
                end
            }

            local vue_ls_config = {}

            vim.lsp.config('vtsls', vtsls_config)
            vim.lsp.config('vue_ls', vue_ls_config)
            vim.lsp.enable({ 'vtsls' })

            -- }}}

            -- Eslint {{{
            local base_on_attach = vim.lsp.config.eslint.on_attach
            vim.lsp.config("eslint", {
                on_attach = function(client, bufnr)
                    if not base_on_attach then return end

                    base_on_attach(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "LspEslintFixAll",
                    })
                end,
            })

            vim.lsp.enable('eslint')
            -- }}}


            -- Swift {{{
            vim.lsp.config('sourcekit', {
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
            })
            vim.lsp.enable('sourcekit')
            -- }}}

            -- Godot {{{
            vim.fn.setenv('GDScript_Port', 6005)
            vim.lsp.enable('gdscript')
            --- }}}


            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { remap = false, silent = true, buffer = event.buf }

                    -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    -- vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

                    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
                    vim.keymap.set('n', '<leader>bf', function() vim.lsp.buf.format { async = true } end, opts)

                    -- With plugins
                    vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<cr>', { buffer = bufnr })
                    vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga rename<cr>', opts)
                    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
                end,
            })

            require("luasnip.loaders.from_vscode").lazy_load({
                include = nil, -- Load all languages
                exclude = {},
            })

            -- Custom snippets
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { "./snippets" },
                include = nil,
                exclude = {},
            })
        end
    },
}
