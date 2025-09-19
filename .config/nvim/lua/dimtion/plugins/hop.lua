-- Easymotion like movements `s<c1><c2>`
-- Works faster in nvim using overlay instead of replacing buffer
return {
  -- Using smoka7 fork instead of phaazon/hop.nvim since main repo is not maintained anymore
  "smoka7/hop.nvim",
  enabled = false,
  version = "*",
  opts = {
    multi_windows = true,
  },
  cmd = {
    "HopAnyWhere",
    "HopCamelCase",
    "HopChar1",
    "HopChar2",
    "HopChar2MW",
    "HopPattern",
    "HopWord",
    "HopLine",
    "HopVertical",
    "HopLineStart",
  },
  keys = {
    {
      "s",
      "<cmd>HopChar2MW<cr>",
      mode = { "n", "v" },
      desc = "Hop/easymotion with 2 chars",
    },
  },
}