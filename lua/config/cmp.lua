local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")

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
				luasnip = "[Snippet]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif snip_status_ok and luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if snip_status_ok and luasnip.jumpable(-1) then
				luasnip.jump(-1)
			elseif cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end),
	}),
	-- Order matters for sources.
	sources = {
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "color_names" },
		{ name = "path" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})
