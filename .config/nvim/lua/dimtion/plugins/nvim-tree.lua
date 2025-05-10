return {
  {
    "nvim-tree/nvim-tree.lua",
    -- enabled = false,
    lazy = false, -- according to plugin owner lazy load is not deterministic
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sort_by = "case_sensitive",
      renderer = {
        group_empty = true,
      },
      view = {
        width = 50,
      },
    },
    keys = {
      {
        "<leader>t",
        ":NvimTreeFindFileToggle<cr>",
        silent = true,
        noremap = true,
        desc = "Toggle nvim-tree for current buffer",
      },
    },
  },
}
