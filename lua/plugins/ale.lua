return {
	"dense-analysis/ale",
	config = function()
		-- Disable PHPStan linter in ALE. Temporary workaround for project throwing "Function not found." errors.
		-- See: https://github.com/salcode/salcode-nvim/issues/30
		vim.g.ale_linters_ignore = { "phpstan" }
	end,
}
