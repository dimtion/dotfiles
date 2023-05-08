-- Set 24 bits colors
vim.opt.termguicolors = true
vim.opt.scrolloff = 2
vim.opt.colorcolumn = "0"

local cc_group = vim.api.nvim_create_augroup("dimtion.status_column_group", {})

-- TODO: support editor config
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

local status_ok, rose_pine = pcall(require, "rose-pine")
if status_ok then
  rose_pine.setup {
    -- disable_background = true,
    -- variant = 'dawn',
    dim_nc_background = true,
    groups = {
      panel = "overlay",
    },
    highlight_groups = {

      -- Blend colours against the "base" background
      CursorLine = { bg = "foam", blend = 10 },
      StatusLine = { fg = "base", bg = "rose", blend = 90 },
      StatusLineNC = { bg = "rose", blend = 10 },
      PmenuSel = { fg = "base", bg = "pine" },
    },
  }
  vim.cmd "colorscheme rose-pine"
  return
end

-- vim.cmd('colorscheme base16-oceanicnext')
--
