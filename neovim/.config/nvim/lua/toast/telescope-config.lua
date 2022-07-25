local M = {}

local git_opts = {
    use_git_root = true,
    show_untracked = true,
    --recurse_submodules = true,
}

local none_git_opts = {
    cwd = vim.g.root_dir,
}

M.project_files = function()
    local ok = pcall(require "telescope.builtin".git_files, git_opts)
    if not ok then require "telescope.builtin".find_files(none_git_opts)
    end
end

M.project_live_grep = function()
    require "telescope.builtin".live_grep(none_git_opts)
end

return M

