local opt = vim.opt

-- Theme
vim.cmd.colorscheme('gruvbox')
opt.termguicolors = true

-- General
opt.compatible = false
opt.colorcolumn = '100'
opt.signcolumn = 'yes' -- Figure out to make line number colored for W/E...
opt.hlsearch = false
opt.ignorecase = true
opt.errorbells = false
opt.wrap = false
opt.cursorline = true
opt.smartcase = true

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

opt.undofile = true
opt.undolevels = 10000

-- opt.conceallevel = 3

-- Folding
opt.foldenable = false
opt.foldlevel = 999

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
	opt.foldmethod = "expr"
	opt.foldexpr = "nvim_treesitter#foldexpr()"
else
	opt.foldmethod = "indent"
end

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
