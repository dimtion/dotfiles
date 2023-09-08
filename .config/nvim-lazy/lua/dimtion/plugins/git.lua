return {
  -- Git wrapper
  { "tpope/vim-fugitive", enabled = true },
  -- Gutter signs
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    lazy = false,
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
        "<leader>hd",
        function()
          require("gitsigns").diffthis()
        end,
        desc = "Diff this buffer",
      },
    },
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = false,
      },
    },
  },
}
