vim.api.nvim_create_autocmd(
    "FileType",
    {
      pattern = {
        "php",
      },
      command = "setlocal commentstring=//%s",
    }
)
