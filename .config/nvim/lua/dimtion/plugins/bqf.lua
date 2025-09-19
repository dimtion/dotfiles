-- Better quick fix window
-- Add a preview to quickfix window
return {
  {
    "kevinhwang91/nvim-bqf",
    dependencies = { "junegunn/fzf" },
    -- enabled = false,
    ft = { "qf" },
  },
}
