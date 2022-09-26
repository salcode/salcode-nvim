vim.g.mapleader = " "
-- vim.g.mapleader = "\<space>" Does this work?

local opt = vim.opt
opt.clipboard = "unnamedplus"

-- require("plugins._config")

-- require("colorscheme")


return require('../packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'dracula/vim', as = 'dracula', config = require("plugins.dracula") }
end)
