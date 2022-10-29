vim.g.coc_global_extensions = {
  'coc-tsserver',
}

-- map <CR> when in insert mode
vim.keymap.set(
	'i',
	'<CR>',
	function()
		if vim.fn['coc#pum#visible']() == 1 then
			-- coc Pop Up Menu (pum) is visible, confirm selection
			vim.fn['coc#pum#confirm']()
		else
			-- coco Pop Up Menu is not open, make no change to <CR>
			return "<CR>"
		end
	end,
	{ expr = true }
);
