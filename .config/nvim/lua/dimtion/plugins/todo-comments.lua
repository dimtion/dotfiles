return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        highlight = {
            pattern = [[.*<(KEYWORDS)[^:]*:]],
        },
        search = {
            pattern = [[\b(KEYWORDS)[^:]*:]],
        },
    },
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>xt", "<cmd>TodoQuickFix<cr>", desc = "Todo (Trouble)" },
    },
  },
}
