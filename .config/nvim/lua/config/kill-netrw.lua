vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.cmd("quit")
  end,
})

