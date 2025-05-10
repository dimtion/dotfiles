-- Comment using space
-- TODO: migrate to nvim integrated?
return {
  {
    "numToStr/Comment.nvim",
    -- enabled = false,
    -- Does not startup correctly if lazy = true
    lazy = false,
    keys = "<space>",
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
