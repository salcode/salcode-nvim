local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	print("Failed to require luasnip. Skipping configuration.")
	return
end

-- for "all" filetypes create snippet for "func"
ls.add_snippets( "all", {
	ls.parser.parse_snippet(
	'func',
	'function ${1}(${2}) \n{\n\t${3}\n}'),
})

-- for "php" filetype create snippet for "class"
ls.add_snippets( "php", {
	ls.parser.parse_snippet('class', 'class $1\n{\n    $0\n}'),
})

-- lazy load snippets from rafamadriz/friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
