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
