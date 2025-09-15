return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- enabled = false,
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use the mini.nvim suite
  ft = { "markdown", "codecompanion" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = { lsp = { enabled = true } },

    render_modes = true,
    heading = {
      backgrounds = {},
      sign = false,
      border = true,
      border_virtual = true,
      below = " ",
      above = " ",
      left_pad = 0,
      -- position = "left",
      icons = {
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
      },
    },

    win_options = {},
  },
}
