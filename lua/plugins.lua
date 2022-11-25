-- Plugin management via Packer
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
	return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer...")
	vim.api.nvim_command("packadd packer.nvim")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- initialize and configure packer
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
	-- Have packer use a popup window
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	-- actual plugins list
	use({ "wbthomason/packer.nvim" })
	use({ "christoomey/vim-tmux-navigator" })
	use({
		"Mofiqul/dracula.nvim",
		config = get_config("dracula"),
	})
	use({ "editorconfig/editorconfig-vim" })
	use({
		"neoclide/coc.nvim",
		branch = 'release',
		config = get_config("coc"),
	})
	use({
		"tpope/vim-commentary",
		config = get_config("commentary"),
	})
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-unimpaired" })
	use({
		"tpope/vim-vinegar",
		config = get_config("vinegar"),
	})
	use({ "vim-airline/vim-airline" })
	use({
		"vim-airline/vim-airline-themes",
		requires = "vim-airline/vim-airline",
		config = get_config("airline"),
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
