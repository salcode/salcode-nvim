return {
	dir = "~/code/nvim-plugins/paste-characterwise.nvim",
	config = function()
		vim.keymap.set(
			'n',
			'<leader>p',
			require("paste-characterwise").paste,
			{ desc = "Paste characterwise" }
		)
	end,
}
