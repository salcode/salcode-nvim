local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local color_names_status_ok, color_names = pcall(require, "cmp-color-names")
if color_names_status_ok then
	color_names.setup()
end

cmp.setup({
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, vim_item)
			vim_item.menu = ({
				buffer = "[Buffer]",
				color_names = "[Color]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	-- Order matters for sources.
	sources = {
		{ name = "buffer" },
		{ name = "color_names" },
		{ name = "path" },
	},
})
