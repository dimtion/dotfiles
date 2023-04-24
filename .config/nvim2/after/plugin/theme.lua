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
