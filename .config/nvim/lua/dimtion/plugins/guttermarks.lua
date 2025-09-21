return {
  "dimtion/guttermarks.nvim",
  -- enabled = false,
  dev = true,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = {
    -- special_mark = { enabled = true },
  },
  keys = {
    {
      "m;",
      function()
        require("guttermarks.actions").delete_mark()
      end,
      desc = "delete mark on current line",
    },
    {
      "<leader>mq",
      function()
        require("guttermarks.actions").marks_to_quickfix()
        vim.cmd "FzfLua quickfix"
        -- vim.cmd("copen")
      end,
      desc = "delete mark on current line",
    },
    {
      "]m",
      function()
        require("guttermarks.actions").next_buf_mark()
      end,
      desc = "Next mark",
    },
    {
      "[m",
      function()
        require("guttermarks.actions").prev_buf_mark()
      end,
      desc = "Prev mark",
    },
  },
}
