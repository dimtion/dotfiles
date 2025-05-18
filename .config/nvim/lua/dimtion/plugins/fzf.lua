-- Using fzf-lua
return {
  {
    "ibhagwan/fzf-lua",
    enabled = true,
    lazy = "VeryLazy",
    keys = {
      {
        "<c-p>",
        function()
          require("fzf-lua").files()
        end,
        silent = true,
        desc = "fzf files",
      },
      {
        "<c-f>",
        function()
          require("fzf-lua").grep()
        end,
        silent = true,
        desc = "fzf grep",
      },
      {
        "<c-f><c-f>",
        function()
          require("fzf-lua").live_grep_native()
        end,
        silent = true,
        desc = "fzf live grep",
      },
      {
        "<c-s>",
        function()
          require("fzf-lua").lsp_live_workspace_symbols()
        end,
        silent = true,
        desc = "fzf live lsp workspace symbols",
      },
      {
        "<leader>c",
        function()
          require("fzf-lua").commands()
        end,
        silent = true,
        desc = "fzf nvim commands",
      },
      {
        "<leader>k",
        function()
          require("fzf-lua").keymaps()
        end,
        silent = true,
        desc = "fzf keymaps",
      },
      {
        "//",
        function()
          require("fzf-lua").grep_visual()
        end,
        mode = "v",
        silent = true,
        desc = "fzf visual grep",
      },
      {
        "<leader>qf",
        function()
          require("fzf-lua").quickfix()
        end,
        mode = "n",
        silent = true,
        desc = "fzf quickfix",
      },
      {
        "<c-m>",
        function()
          require("fzf-lua").marks()
        end,
        silent = true,
        desc = "fzf marks",
      },
      {
        "<leader>hh",
        function()
          require("fzf-lua").help_tags()
        end,
        silent = true,
        desc = "fzf help tags",
      },
      { "<leader>gl", "<cmd>FzfLua git_bcommits<cr>", silent = true, desc = "Git log (current buffer)", },
    },
    opts = {
      "border-fused",
      -- preview={default="down"}
      -- fzf_opts = {
      --   ['--preview-window'] = 'nohidden,down,50%',
      -- },
      fzf_opts = {
        ["--history"] = vim.fn.stdpath "data" .. "fzf-lua-history",
        ["--padding"] = "1,2",
      },
      winopts = {
        backdrop = 30,
        preview = {
          default = "builtin",
          vertical = "down:70%",
          horizontal = "right:70%",
          layout = "flex", -- Note: `vertical` is good for long lines
          scrollbar = "border",
        },
        treesitter = {
          enabled = true,
          -- fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
        },
      },
      fzf_colors = {
        ["bg+"] = { "bg", "FzfLuaFzfCursorLine" },
        ["separator"] = { "fg", "FzfLuaFzfSeparator" },
        ["gutter"] = "-1",
      },
      previewers = {
        builtin = {
          extensions = {
            -- neovim terminal only supports `viu` block output
            ["png"] = { "viu", "-b" },
            ["jpg"] = { "viu", "-b" },
            ["jpeg"] = { "viu", "-b" },
          },
        },
      },
    },
    config = function(_, opts)
      local fzf = require "fzf-lua"
      fzf.setup(opts)
      -- Use fzf as a ui-select
      fzf.register_ui_select()
    end,
  },
  {
    'junegunn/fzf',
    lazy = "VeryLazy",
    build = ":call fzf#install()",
  },
}