-- Included in nvim > 0.9
-- See: https://editorconfig.org/
return {
  {
    "editorconfig/editorconfig-vim",
    enabled = vim.fn.has('nvim-0.9') == 0,
  },
}
