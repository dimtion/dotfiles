-- Autocmd to remove trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "markdown" then
      vim.cmd "%s/\\s\\+$//e"
    end
  end,
})
