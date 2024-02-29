return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-dap.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' }
        },
        cmd = "Telescope",
        keys = {
            -- Search
            {
                "<leader><leader>",
                '<CMD>lua require("toast.telescope-config").project_files()<CR>',
                desc = "Fuzzy search through the output of `git ls-files` command, respects .gitignore",
                noremap = true,
                silent = true
            },
            {
                '<leader>F',
                '<cmd>lua require("telescope.builtin").find_files({hidden = true})<cr>',
                desc = 'Find files in the current working directory',
                noremap = true,
                silent = true
            },
            {
                '<leader>sp',
                '<cmd>lua require("toast.telescope-config").project_live_grep({hidden = true})<cr>',
                desc = 'Live grep in the current working directory',
                noremap = true,
                silent = true
            },
            {
                '<leader>bb',
                '<cmd>lua require("telescope.builtin").buffers()<cr>',
                desc = 'Find open buffer',
                noremap = true,
                silent = true
            },
            {
                '<leader>fh',
                '<cmd>lua require("telescope.builtin").help_tags()<cr>',
                desc = 'Search in the vim help files',
                noremap = true,
                silent = true
            },
            {
                '<leader>fc',
                '<cmd>lua require("telescope.builtin").commands()<cr>',
                desc = 'Search for vim/plugin commands',
                noremap = true,
                silent = true
            },
            {
                '<leader>fp',
                '<cmd>lua require("telescope.builtin").pickers()<cr>',
                desc = 'Lists the previous pickers incl. multi-selections',
                noremap = true,
                silent = true
            },

            -- Git
            {
                '<leader>gb',
                '<cmd>lua require("telescope.builtin").git_branches()<cr>',
                desc = 'Change git branch',
                noremap = true,
                silent = true
            },
            {
                '<leader>gt',
                '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>',
                desc = 'Change git working tree',
                noremap = true,
                silent = true
            },
            {
                '<leader>gT',
                '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>',
                desc = 'delete git working tree',
                noremap = true,
                silent = true

            },
            {
                '<leader>gc',
                '<cmd>lua require("telescope.builtin").git_commits()<cr>',
                desc =
                'Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h',
                noremap = true,
                silent = true
            },
            {
                '<leader>gC',
                '<cmd>lua require("telescope.builtin").git_bcommits()<cr>',
                desc = 'Lists buffer\'s git commits with diff preview and checks them out on <cr>',
                noremap = true,
                silent = true
            },

            -- Treesitter
            {
                '<leader>s',
                '<cmd>lua require("telescope.builtin").treesitter()<cr>',
                desc = 'Lists Function names, variables, from Treesitter',
                noremap = true,
                silent = true
            },

            -- Keymap help
            {
                '<leader>fk',
                '<cmd>lua require("telescope.builtin").keymaps()<cr>',
                desc = 'Lists normal mode keymappings',
                noremap = true,
                silent = true
            },
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    layout_strategy = "vertical",
                    layout_config = {
                        height = 0.95,
                        prompt_position = 'bottom',
                    },
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ["<C-h>"] = "which_key"
                        }
                    }
                },
                pickers = {
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --   picker_config_key = value,
                    --   ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                },
                extensions = {
                    -- Your extension configuration goes here:
                    -- extension_name = {
                    --   extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            layout_config = {
                                height = 0.80,
                                width = 0.60,
                                prompt_position = 'top',
                            },
                            layout_strategy = "horizontal",
                            -- even more opts
                        },
                    }
                }
            }
            require("telescope").load_extension("ui-select")
            -- require('telescope').load_extension('dap')
        end
    }
}
