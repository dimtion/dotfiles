return {
  -- Git wrapper
  -- {
  --   "tpope/vim-fugitive",
  --   enabled = false,
  --   keys = {
  --     {
  --       "<leader>gb",
  --       ":Git blame -wMC --date=short<CR>",
  --       { silent = true, desc = "Git blame file" },
  --     },
  --   },
  -- },
  -- Gutter signs
  {
    "lewis6991/gitsigns.nvim",
    -- enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "]c",
        function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            require("gitsigns").next_hunk()
          end)
          return "<Ignore>"
        end,
        expr = true,
        desc = "Next git hunk",
      },
      {
        "[c",
        function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            require("gitsigns").prev_hunk()
          end)
          return "<Ignore>"
        end,
        expr = true,
        desc = "Previous git hunk",
      },
      {
        "<leader>gb",
        "<cmd>Gitsigns blame<cr>",
        silent = true,
        desc = "Git blame buffer",
      },
      {
        "<leader>gsb",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "Toggle current line git blame",
      },
      {
        "<leader>gh",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Preview or display git hunk",
      },
      {
        "<leader>gd",
        function()
          require("gitsigns").diffthis()
        end,
        desc = "Diff this buffer with index",
      },
      {
        "<leader>gD",
        function()
          require("gitsigns").diffthis "~"
        end,
        desc = "Diff this buffer with the parent commit",
      },
      {
        "<leader>gr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "Reset git hunk",
        mode = { "n" },
      },
      {
        "<leader>gr",
        function()
          require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end,
        desc = "Reset git hunk",
        mode = { "v" },
      },
      {
        "ih",
        "<cmd>Gitsigns select_hunk<cr>",
        mode = { "o", "x" },
        desc = "Select git hunk",
      },
    },
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
        ignore_whitespace = false,
      },
      -- word_diff = true,
      linehl = false,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)

      require("which-key").add {}
    end,
  },
  {
    -- URL to upstream web repos
    "linrongbin16/gitlinker.nvim",
    -- enabled = false,
    cmd = "GitLink",
    keys = {
      {
        "<leader>gy",
        "<cmd>GitLink<cr>",
        mode = { "n", "v" },
        desc = "Yank git repo link",
      },
      {
        "<leader>gY",
        "<cmd>GitLink!<cr>",
        mode = { "n", "v" },
        desc = "Open git repo link!",
      },
    },
    opts = {},
  },
  {
    "sindrets/diffview.nvim",
    -- enabled = false,
    cmd = {
      "DiffviewFileHistory",
      "DiffviewOpen",
      "DiffviewLog",
      "DiffviewRefresh",
    },
    keys = {
      {
        "<leader>gD",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd "DiffviewOpen"
          else
            vim.cmd "DiffviewClose"
          end
        end,
      },
    },
  },
}