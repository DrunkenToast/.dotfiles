return {
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
}
