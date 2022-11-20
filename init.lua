require("commands")
require("mappings")
require("plugins")
require("options")

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({timeout = 250})
  end,
  group = highlight_group,
  pattern = '*',
})
