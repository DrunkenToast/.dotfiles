return {
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = {
            -- flutter_lookup_cmd = "echo \"$(fvm api project | jq '.project.localFvmPath' -r)/flutter_sdk/\"", -- example "dirname $(which flutter)" or "asdf where flutter"
        },
    }
}
