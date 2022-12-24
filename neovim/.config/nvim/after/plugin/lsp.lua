local lsp = require('lsp-zero')
local lspkind = require('lspkind')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'sumneko_lua',
    'marksman',
})

local rust_lsp = lsp.build_options('rust_analyzer', {})

lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    formatting = {
        format = lspkind.cmp_format(),
    }
})

lsp.setup()

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

        -- -- Defaults by lsp zero recommended
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

        -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>CodeActionMenu<CR>', opts)
        vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>bf', function() vim.lsp.buf.format { async = true } end, opts)

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

