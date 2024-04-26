-- Active indent guide and indent text objects. When you're browsing
-- code, this highlights the current level of indentation, and animates
-- the highlighting.
return {
  {
    "echasnovski/mini.indentscope",
    -- version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
      draw = {
          animation = function() return 0 end, -- no animation
          delay = 50,
      }
    },
    init = function()
      require('mini.indentscope').gen_animation.none()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
