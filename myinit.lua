-- vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.colorcolumn = "80"
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
vim.wrap = true
vim.macmeta = true
vim.updatetime = 1000

-- folding
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
