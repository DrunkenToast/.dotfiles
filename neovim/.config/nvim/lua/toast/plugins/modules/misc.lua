return {
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            -- 'f-person/git-blame.nvim',
        },
        event = { 'VimEnter' },
        config = function()
            -- -- vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
            -- local git_blame = require('gitblame').setup({
            --
            -- })

            require('lualine').setup {
                options = {
                    theme = 'gruvbox',
                    component_separators = '|',
                    section_separators = { left = '', right = '',
                    },
                },
                sections = {
                    lualine_b = { 'filename' },
                    lualine_c = { 'branch', 'diff', 'diagnostics' },
                    lualine_x = { 'filetype' }
                }
            }
        end
    },

    -- Git blame
    {
        'f-person/git-blame.nvim',
        opts = {
            enabled = false, -- First load is toggle
        },
        keys = {
            {
                "<leader>tb",
                '<CMD>GitBlameToggle<CR>'
            }
        }
    },

    -- Twilight
    {
        'folke/twilight.nvim',
        opts = {},
        keys = {
            {
                "<leader>z",
                "<cmd>Twilight<CR>",
                desc = 'Twilight, dim inactive portions of code you\'re editing',
                noremap = true,
                silent = true
            },
        }
    },

    -- Highlight colors
    {
        'NvChad/nvim-colorizer.lua',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require 'colorizer'.setup({
                filetypes = {
                    'javascript',
                    'typescript',
                    'vue',
                    'lua',
                    'json',
                    'toml',
                    'svelte',
                    'sass',
                    'scss',
                    css = { css = true, },    -- Enable parsing rgb(...) functions in css.
                    html = { names = false, } -- Disable parsing 'names' like Blue or Gray
                },
                user_default_options = {
                    tailwind = 'lsp',
                    sass = { enable = true },
                },
            })
        end
    },

    -- Let it rain
    {
        'eandrju/cellular-automaton.nvim',
        keys = {
            {
                "<leader>gol",
                "<cmd>CellularAutomaton game_of_life<CR>",
                desc = 'Well, fml. Let it rain',
                noremap = true,
                silent = true
            },
            {
                "<leader>fml",
                "<cmd>CellularAutomaton make_it_rain<CR>",
                desc = 'Well, fml. Let it rain',
                noremap = true,
                silent = true
            }
        }
    },

    {
        "Febri-i/snake.nvim",
        dependencies = {
            "Febri-i/fscreen.nvim"
        },
        cmd = "SnakeStart",
        opts = {}
    },

    -- Discord
    {
        "andweeb/presence.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("presence").setup({
                -- General options
                auto_update         = true,                                    -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
                neovim_image_text   = "Wasted more time on the editor itself", -- Text displayed when hovered over the Neovim image
                main_image          = "neovim",                                -- Main image display (either "neovim" or "file")
                client_id           = "793271441293967371",                    -- Use your own Discord application client id (not recommended)
                log_level           = nil,                                     -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
                debounce_timeout    = 10,                                      -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
                enable_line_number  = false,                                   -- Displays the current line number instead of the current project
                blacklist           = {},                                      -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
                buttons             = false,                                   -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
                file_assets         = {},                                      -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
                -- Rich Presence text options
                editing_text        = "Editing madness",                       -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
                file_explorer_text  = "Browsing %s",                           -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
                git_commit_text     = "Committing changes",                    -- Format string rendered when committing changes in git (either string or function(filename: string): string)
                plugin_manager_text = "Managing plugins",                      -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
                reading_text        = "Reading %s",                            -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
                workspace_text      = "Working on %s",                         -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
                line_number_text    = "Line %s out of %s",                     -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
            })
        end,
    }
}
