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

-- Map "Ctrl + p" (in insert mode)
-- to expand snippet and jump through fields.
vim.keymap.set(
'i',
'<c-p>',
function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end
)
