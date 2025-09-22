-- Set 24 bits colors
vim.opt.termguicolors = true
vim.opt.scrolloff = 2
vim.opt.colorcolumn = "0"
vim.opt.winborder = "rounded"

-- Create autocmd to hide and show color-column when entering insert mode
local cc_group = vim.api.nvim_create_augroup("dimtion.status_column_group", {})
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = cc_group,
  callback = function()
    local default = "80"
    local editorconfig = vim.b.editorconfig
    if editorconfig and editorconfig.max_line_length then
      vim.opt.colorcolumn = editorconfig.max_line_length or default
    else
      vim.opt.colorcolumn = default
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = cc_group,
  callback = function()
    vim.opt.colorcolumn = "0"
  end,
})

vim.cmd "colorscheme rose-pine"
vim.cmd "set background=dark"

-- Enable word wrap for Markdown files
vim.api.nvim_create_augroup("dimtion.wrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "dimtion.wrap",
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 80
  end,
})

vim.opt.fillchars:append {
  diff = "╱",
  eob = " ",
  vert = " ",
}

-- Only show cursorline in current buffer
vim.api.nvim_create_augroup("dimtion.CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = "dimtion.CursorLine",
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = "dimtion.CursorLine",
  callback = function()
    vim.opt_local.cursorline = false
  end,
})
