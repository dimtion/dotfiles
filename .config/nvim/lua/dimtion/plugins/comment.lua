-- Comment using space
-- TODO: migrate to nvim integrated?
return {
  {
    "numToStr/Comment.nvim",
    -- enabled = false,
    keys = {
      {
        "<space>",
        desc = "Toggle comment",
      },
      {
        "<space>",
        mode = "v",
        desc = "Toggle comment",
      },
    },
    opts = {
      toggler = {
        ---Line-comment toggle keymap
        line = "<space>",
      },
      opleader = {
        ---Line-comment keymap
        line = "<space>",
      },
    },
  },
}
