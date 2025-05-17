return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },

    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      documentation = { auto_show = true },
      ghost_text = {
        enabled = true,
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
      providers = {
        lsp = {
          -- do not fallback to buffer source, always use buffer source
          fallbacks = {},
          async = true,
        },
      },
    },

    signature = { enabled = true },
  },
}
