return {
	"editorconfig/editorconfig-vim",
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
		},
	},
	"justinmk/vim-dirvish",
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set({ 'n', 'v' }, ']c', function()
					if vim.wo.diff then
						return ']c'
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return '<Ignore>'
				end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
				vim.keymap.set({ 'n', 'v' }, '[c', function()
					if vim.wo.diff then
						return '[c'
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return '<Ignore>'
				end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })

				vim.keymap.set('n', '<leader>gb', function() gs.blame_line{full=true} end)
			end,
		},
	},
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
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
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
}
