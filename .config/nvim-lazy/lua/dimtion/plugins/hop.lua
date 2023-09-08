return {
  "phaazon/hop.nvim",
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
    vim.keymap.set({"n", "v"}, "s", "<cmd>HopChar2MW<cr>", k_opts)
  end,
}
