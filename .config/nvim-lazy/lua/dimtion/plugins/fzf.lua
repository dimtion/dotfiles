return {
  {
    "ibhagwan/fzf-lua",
    enabled = true,
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
    },
    opts = {
      "telescope",
      -- preview={default="down"}
      -- fzf_opts = {
      --   ['--preview-window'] = 'nohidden,down,50%',
      -- },
      winopts = {
        preview = {
          default = "builtin",
          vertical = "up:60%",
          horizontal = "right:70%",
          layout = "flex", -- Note: vertical is good for long lines
        },
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
  },
}
