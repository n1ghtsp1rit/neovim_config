-------------------------------------------------
-- Basic Settings
-------------------------------------------------
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

------------------------------------------------
-- Relative Line Number Highlighting
------------------------------------------------
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "Cyan" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "Cyan" })
