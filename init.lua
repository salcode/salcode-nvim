-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

require("options")
require("commands")
require("mappings")
require("lazy").setup('plugins',
{
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

local function paste_character_wise()
	local register_value = vim.fn.getreg(vim.v.register)
	if vim.fn.getregtype(vim.v.register) == "V" then
		-- Register is linewise
		-- Paste characterwise and trim trailing newline
		vim.api.nvim_paste(register_value:gsub("\n$", ""), true, -1)
	else
		-- Default paste behavior.
		vim.api.nvim_paste(register_value, true, -1)
	end
end
vim.keymap.set('n', '<leader>p', paste_character_wise, { desc = "Paste characterwise" })
