return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "mgalliou/blink-cmp-tmux", dev = false },
  },
  event = { "InsertEnter", "CmdlineEnter" },
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
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
        window = { border = "padded" },
      },
      ghost_text = {
        enabled = true,
      },
      menu = {
        border = "none",
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "kind_icon", "label", "label_description", gap = 1 },
            { "source_name" },
          },
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "tmux" },
      per_filetype = {
        codecompanion = { "codecompanion" },
        lua = { inherit_defaults = true, "lazydev" },
      },
      providers = {
        lsp = {
          -- do not fallback to buffer source, always use buffer source
          fallbacks = {},
          async = true,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        tmux = {
          module = "blink-cmp-tmux",
          name = "tmux",
          -- default options
          opts = {
            session_panes = true,
            capture_history = false,
          },
          score_offset = -15,
          transform_items = function(ctx, items)
            for _, item in ipairs(items) do
              item.kind_icon = ""
              item.kind_name = "Tmux"
            end
            return items
          end,
        },
      },
    },

    signature = {
      enabled = true,
      window = { border = "padded" },
    },
    cmdline = {
      keymap = { preset = "default" },
      completion = {
        menu = { auto_show = true },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },
    },
  },
}
