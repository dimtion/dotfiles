return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    keys = {
      { "<C-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      -- A list of parser names, or "all"
      ensure_installed = {
        "vimdoc",
        -- "javascript",
        -- "typescript",
        -- "c",
        "lua",
        -- "rust",
        "python",
        -- "bash",
        -- "java",
        -- "yaml",
        -- "json",
        -- "go",
        "regex",
        "markdown",
        "markdown_inline",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          -- scope_incremental = "<C-space>",
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      return require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    -- Show current function at the top of the buffer
    "nvim-treesitter/nvim-treesitter-context",
    enabled = true,
    opts = {
      max_lines = 3,
      -- multiline_threshold = 3,
      min_window_height = 30,
    },
  },
}
