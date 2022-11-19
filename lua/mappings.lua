local set = vim.keymap.set

vim.g.mapleader = " "

-- Mappings to indent with tabs or spaces.
------------------------------------------
-- Set indentation to 2 spaces.
set("n", "<leader>ts2", ":set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>")
-- Set indentation to 4 spaces.
set("n", "<leader>ts4", ":set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>")
-- Set indentation to tabs, rendered as size 4 spaces.
set("n", "<leader>tt4", ":set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>")

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Do not replace register contents when pasting over a visual selection
set("v", "p", '"_dP')
