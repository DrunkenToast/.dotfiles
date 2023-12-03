return {
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('gitsigns').setup()
        end
    },

    {
        "sindrets/diffview.nvim",
        event = { 'VeryLazy' },
        opts = {
            enhanced_diff_hl = true,
        }
    },

}
