-- options
vim.g.mapleader = " "
-- vim.g.mapleader = "\<space>" Does this work?

local o = vim.opt
o.clipboard = "unnamedplus"
o.expandtab = false
o.shiftwidth = 4
o.tabstop = 4
o.relativenumber = true
o.number = true
o.termguicolors = true
o.swapfile = false
o.showmode = false
o.list = true
o.listchars = { tab = '> ', trail = '-', extends = '>', precedes = '<' , nbsp = '+' }
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.iskeyword:append "-"
