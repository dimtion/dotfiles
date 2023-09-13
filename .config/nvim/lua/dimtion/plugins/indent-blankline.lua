return {
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false, -- pluging is very visually heavy and a bit buggy too
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      -- char = "│",
      filetype_exclude = {
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
        "translator",
        "dapui_breakpoints",
        "dapui_watches",
        "dapui_stacks",
        "dapui_scopes",
        "",
        "help",
        "packer",
        "startify",
        "dashboard",
        "vimwiki",
        "markdown",
        "calendar",
      },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
    config = function(_, opts)
      vim.g.indent_blankline_use_treesitter_scope = true
      require("indent_blankline").setup(opts)
    end,
  },
  -- Active indent guide and indent text objects. When you're browsing
  -- code, this highlights the current level of indentation, and animates
  -- the highlighting.
  {
    "echasnovski/mini.indentscope",
    -- version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
      animation = function(s, n) return 5 end,
      delay = 150,
    },
    init = function()
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
