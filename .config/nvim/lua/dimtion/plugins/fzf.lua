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
          require("fzf-lua").global()
        end,
        silent = true,
        desc = "Files (fzf)",
      },
      {
        "<c-f>",
        function()
          require("fzf-lua").grep()
        end,
        silent = true,
        desc = "Grep (fzf)",
      },
      {
        "<c-f><c-f>",
        function()
          require("fzf-lua").live_grep_native()
        end,
        silent = true,
        desc = "Live grep (fzf)",
      },
      {
        "<Leader>ls",
        function()
          require("fzf-lua").lsp_live_workspace_symbols()
        end,
        silent = true,
        desc = "live grep lsp workspace symbols (fzf)",
      },
      {
        "//",
        function()
          require("fzf-lua").grep_visual()
        end,
        mode = "v",
        silent = true,
        desc = "Grep visual selection (fzf)",
      },
      {
        "**",
        function()
          require("fzf-lua").grep_cword()
        end,
        mode = "n",
        silent = true,
        desc = "Grep word under cursor (fzf)",
      },
      {
        "<leader>qf",
        function()
          require("fzf-lua").quickfix()
        end,
        mode = "n",
        silent = true,
        desc = "Quickfix (fzf)",
      },
      -- {
      --   "<c-m>",
      --   function()
      --     require("fzf-lua").marks()
      --   end,
      --   silent = true,
      --   desc = "List marks (fzf)",
      -- },
      {
        "<leader>hH",
        "<cmd>FzfLua highlights<cr>",
        silent = true,
        desc = "Neovim highlight groups (fzf)",
      },
      {
        "<leader>hh",
        "<cmd>FzfLua help_tags<cr>",
        silent = true,
        desc = "Neovim help tags (fzf)",
      },
      {
        "<leader>hk",
        "<cmd>FzfLua keymaps<cr>",
        silent = true,
        desc = "Neovim keymaps (fzf)",
      },
      {
        "<leader>hc",
        "<cmd>FzfLua commands<cr>",
        silent = true,
        desc = "Neovim commands (fzf)",
      },
      {
        "<leader>gl",
        "<cmd>FzfLua git_bcommits<cr>",
        silent = true,
        desc = "Git log current buffer (fzf)",
      },
      {
        "<leader>fj",
        "<cmd>FzfLua jumps<cr>",
        silent = true,
        desc = "Jump list (fzf)",
      },
      {
        "grr",
        "<cmd>FzfLua lsp_references<cr>",
        silent = true,
        desc = "LSP References (fzf)",
      },
      {
        "<c-\\>",
        "<cmd>FzfLua resume<cr>",
        silent = true,
        desc = "Resume FzfLua",
      },
    },
    cmd = {
      "FzfLua",
    },
    opts = {
      "hide",
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
    "junegunn/fzf",
    lazy = "VeryLazy",
    build = ":call fzf#install()",
  },
}
