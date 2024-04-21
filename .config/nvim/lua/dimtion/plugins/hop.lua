-- Easymotion like movements `s<c1><c2>`
-- Works faster in nvim using overlay instead of replacing buffer
return {
  -- Using smoka7 fork instead of phaazon/hop.nvim since main repo is not maintained anymore
  "smoka7/hop.nvim",
  enabled = true,
  lazy = false,
  version = "*",
  -- event = "VeryLazy",
  -- event = { "CursorHold", "CursorHoldI" },
  -- cmd = { "HopChar2MW" },
  opts = {
    multi_windows = true,
  },
  config = function(_, opts)
    require("hop").setup(opts)

    local k_opts =
      { noremap = true, silent = true, desc = "Hop/easymoting with 2 chars" }
    vim.keymap.set({ "n", "v" }, "s", "<cmd>HopChar2MW<cr>", k_opts)
  end,
}
