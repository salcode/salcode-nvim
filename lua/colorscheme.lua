local colorscheme = "blue"
local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("Failed to set colorscheme \"" .. colorscheme .. "\"")
end
