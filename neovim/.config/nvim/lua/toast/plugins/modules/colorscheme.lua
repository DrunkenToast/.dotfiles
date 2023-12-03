return {
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.api.nvim_create_autocmd({ "ColorScheme" }, {
                pattern = { "*" },
                callback = function()
                    vim.api.nvim_set_hl(0, "DiffText", { fg = "#282828", bg = "#83a598" })
                end,
            }
            )
        end
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                theme = "dragon", -- Load "wave" theme when 'background' option is not set
                -- background = {     -- map the value of 'background' option to a theme
                --     dark = "wave", -- try "dragon" !
                --     light = "lotus"
                -- },
            })
        end
    },
    {
        'AlexvZyl/nordic.nvim',
    },
    {
        'sainnhe/gruvbox-material',
    },
    {
        "savq/melange-nvim"
    }
}
