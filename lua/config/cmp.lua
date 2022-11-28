local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	-- Order matters for sources.
	sources = {
		{ name = "buffer" },
	},
})
