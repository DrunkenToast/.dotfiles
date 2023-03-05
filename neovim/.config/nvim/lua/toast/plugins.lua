local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer, close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Themes
    -- use 'gruvbox-community/gruvbox'
    use { "ellisonleao/gruvbox.nvim" }
    use "rebelot/kanagawa.nvim"

    -- Misc
    use 'NvChad/nvim-colorizer.lua'
    use {
        'goolord/alpha-nvim',
    }
    use { 'anuvyklack/fold-preview.nvim',
        requires = 'anuvyklack/keymap-amend.nvim',
        config = function()
            require('fold-preview').setup()
        end,
    }
    use 'eandrju/cellular-automaton.nvim'

    -- Markdown
    use 'ekickx/clipboard-image.nvim'
    --- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Discord
    use 'andweeb/presence.nvim'

    -- File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        }
    }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
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
        }
    }
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp-signature-help"

    use "onsails/lspkind-nvim"

    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
    })

    use({
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    })

    use 'simrat39/rust-tools.nvim'
    use {
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }

    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- Debugging
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"

    -- use 'leoluz/nvim-dap-go' -- Go not done
    -- use 'mfussenegger/nvim-dap-python' -- Python not done

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- Telescope
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use "p00f/nvim-ts-rainbow"

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {
                check_ts = true,
            }
        end
    }

    -- git
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use "tpope/vim-fugitive"
    --use "saadparwaiz1/cmp_luasnip" -- snippet completions
end)
