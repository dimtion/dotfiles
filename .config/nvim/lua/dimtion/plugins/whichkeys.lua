return {
  {
    "folke/which-key.nvim",
    -- enabled = false,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      preset = "helix",
      spec = {
        { "<leader>f", group = "File/Buffer" },
        { "<leader>g", group = "Git" },
        { "<leader>i", group = "Insert" },
        { "<leader>l", group = "LSP" },
        { "<leader>r", group = "Run - Job" },
        { "<leader>d", group = "Debug - DAP" },
        { "<leader>h", group = "Help" },
        { "<leader>x", group = "Extra" },
        { "<leader>a", group = "AI" },
      },
    },
  },
}
