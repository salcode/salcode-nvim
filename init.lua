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
require("lazy").setup({
	{
		"Mofiqul/dracula.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme dracula]])
		end,
	},
	"christoomey/vim-tmux-navigator",
	"editorconfig/editorconfig-vim",
	"justinmk/vim-dirvish",
	{
		"tpope/vim-commentary",
		config = function()
			vim.api.nvim_create_autocmd(
				"FileType",
				{
					pattern = { "php" },
					command = "setlocal commentstring=//%s",
				}
			)
		end
	},
	{
		"vim-airline/vim-airline",
		config = function()
			local set = vim.api.nvim_set_var

			set('airline_theme', 'base16_dracula')
			set('airline_skip_empty_sections', 1)

			set('airline_left_sep', '')
			set('airline_right_sep', '')

			set('airline#extensions#tabline#left_sep', ' ')
			set('airline#extensions#tabline#left_alt_sep', ' ')
			set('airline#extensions#tabline#enabled', 1)
			set('airline#extensions#tabline#fnamemod', ':t')
			set('airline#extensions#tabline#formatter', 'jsformatter')
		end,
		dependencies = "vim-airline/vim-airline-themes",
	},
})
