-- Comment using space
return {
  {
    "numToStr/Comment.nvim",
    enabled = true,
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
