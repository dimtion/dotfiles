vim.api.nvim_set_hl(0, "LspInlayHint", { italic = true })

return {
  -- Web icons
  { "nvim-tree/nvim-web-devicons", lazy = false, priority = 1002 },

  -- Follow system dark/light mode using SIGWING
  -- Lumen is very slow... and not working.. disabling it..
  -- { "vimpostor/vim-lumen", lazy = false, priority = 1001 },

  -- rose-pine theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      -- disable_background = true,
      -- variant = 'dawn',
      dim_nc_background = true,
      groups = {
        -- border = { fg = "muted", bg = "none" },
        panel = "overlay",
      },
      highlight_groups = {

        -- Blend colours against the "base" background
        CursorLine = { bg = "pine", blend = 30 },
        -- StatusLine = { fg = "base", bg = "rose", blend = 90 },
        -- StatusLineNC = { bg = "rose", blend = 10 },
        FloatBorder = { fg = "muted", bg = "none" },
        NormalFloat = { fg = "text", bg = "none" },
        FzfLuaTitle = { fg = "gold", bg = "none" },

        FzfLuaBorder = { fg = "muted", bg = "none" },
        FzfLuaPreviewBorder = { fg = "muted", bg = "none" },
        FzfLuaCursorLine = { bg = "pine", blend = 50 },
        FzfLuaFzfCursorLine = { bg = "pine", blend = 30 },
        FzfLuaPathLineNr = { bg = "pine"},
        FzfLuaBufFlagCur = { bg = "pine"},
        FzfLuaFzfSeparator = { fg = "gold" },

        -- FzfLuaBackdrop = { bg = "foam"},

        StatusLine = { fg = "love", bg = "love", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },

        PmenuSel = { fg = "base", bg = "pine" },
        LspInlayHint = { fg = "subtle" },
        GitSignsCurrentLineBlame = { fg = "subtle" },
      },
    },
  },
}