return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    default_mapping = false,
  },
  {
    "fnune/recall.nvim",
    version = "*",
    lazy = false,
    keys = {
      { "mm", "<cmd>RecallToggle<cr>", silent = true, noremap = true, desc = "Toggle recall mark" },
      { "mn", "<cmd>RecallNext<cr>", silent = true, noremap = true, desc = "Next recall mark" },
      { "mp", "<cmd>RecallPrevious<cr>", silent = true, noremap = true, desc = "Previous recall mark" },
      { "mc", "<cmd>RecallClear<cr>", silent = true, noremap = true, desc = "Clear recall marks" },
    },
    opts = {},
    -- config = function(_, opts)
    --   local recall = require("recall")
    --
    --   recall.setup({})
    -- end
  }
}