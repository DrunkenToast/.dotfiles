local opt = vim.opt

-- Theme
vim.cmd.colorscheme('gruvbox')
opt.termguicolors = true


-- General
opt.compatible = false
opt.colorcolumn = "80"
opt.signcolumn = 'yes' -- Figure out to make line number colored for W/E...
opt.hlsearch = false
opt.ignorecase = true
opt.errorbells = false
opt.wrap = false
opt.cursorline = true

opt.laststatus = 2
opt.showmode = false

opt.relativenumber = true
opt.number = true
opt.scrolloff = 8

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

opt.mouse = 'a'

-- opt.conceallevel = 3

-- Folding
opt.foldenable = true
opt.foldlevel = 99

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
    opt.foldmethod = "expr"
    opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
else
    opt.foldmethod = "indent"
end

if vim.fn.has("nvim-0.10") == 1 then
    opt.smoothscroll = true
end

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
