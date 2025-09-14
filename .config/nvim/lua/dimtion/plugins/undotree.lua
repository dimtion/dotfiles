-- Show nvim undotree
-- Every change has a sequence number and it is displayed before timestamps.
-- The current state is marked as > number <.
-- The next state which will be restored by :redo or <ctrl-r> is marked as { number }.
-- The [ number ] marks the most recent change.
-- The undo history is sorted by timestamps.
-- Saved changes are marked as s and the big S indicates the most recent saved change.
--
-- Traverse the tree forward in time with g+
-- Traverse the tree back in time with g-
return {
  {
    "mbbill/undotree",
    -- enabled = false,
    lazy = true,
    cmd = {
      "UndotreeToggle",
    },
    keys = {
      {
        "<leader>u",
        "<cmd>UndotreeToggle<cr>",
        desc = "Show nvim undotree",
      },
      {
        "<leader>fh",
        "<cmd>UndotreeToggle<cr>",
        desc = "Show nvim undotree (file history)",
      },
      config = true,
    },
  },
}
