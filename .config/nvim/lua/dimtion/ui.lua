-- Set 24 bits colors
vim.opt.termguicolors = true
vim.opt.scrolloff = 2
vim.opt.colorcolumn = "0"

-- Create autocmd to hide and show color-column when entering insert mode
-- TODO: support editor config / variable lenght
local cc_group = vim.api.nvim_create_augroup("dimtion.status_column_group", {})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = cc_group,
  callback = function()
    print "enter"
    vim.opt.colorcolumn = "80"
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = cc_group,
  callback = function()
    print "leave"
    vim.opt.colorcolumn = "0"
  end,
})

vim.cmd "colorscheme rose-pine"
