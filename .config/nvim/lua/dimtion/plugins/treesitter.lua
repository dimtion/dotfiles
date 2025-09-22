local function start_ts(bufnr, parser_name)
  vim.treesitter.start(bufnr, parser_name)
  vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    branch = "main",
    version = false,
    build = function()
      local TS = require "nvim-treesitter"
      if not TS.get_installed then
        vim.notify "Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch."
        return
      end
      TS.update(nil, { summary = true })
    end,
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    event = { "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "regex",
        "rust",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
    config = function(_, opts)
      local TS = require "nvim-treesitter"
      TS.setup()
      TS.install(opts.ensure_installed)

      -- Auto-install and start parsers for any buffer
      vim.api.nvim_create_augroup("dimtion.ts", { clear = true })
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = "dimtion.ts",
        callback = function(event)
          local bufnr = event.buf
          local filetype =
            vim.api.nvim_get_option_value("filetype", { buf = bufnr })

          if filetype == "" then
            return
          end

          for _, filetypes in pairs(opts.ensure_installed) do
            local ft_table = type(filetypes) == "table" and filetypes
              or { filetypes }
            if vim.tbl_contains(ft_table, filetype) then
              start_ts(bufnr)
              return -- Already handled above
            end
          end

          local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
          if not parser_name then
            return
          end

          local parser_configs = require "nvim-treesitter.parsers"
          if not parser_configs[parser_name] then
            return -- Parser not available, skip silently
          end

          require("nvim-treesitter").install({ parser_name }):await(function()
            start_ts(bufnr, parser_name)
          end)
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      -- select
      {
        "af", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end,
        desc = "Function outer",
      },
      {
        "if", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end,
        desc = "Function inner",
      },
      {
        "aC", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
        end,
        desc = "Class outer",
      },
      {
        "iC", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
        end,
        desc = "Class inner",
      },
      {
        "ac", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
        end,
        desc = "Comment outer",
      },
      {
        "ic", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@comment.inner", "textobjects")
        end,
        desc = "Comment inner",
      },
      {
        "as", mode = { "x", "o" }, function()
          require ("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
        end,
        desc = "Local scope",
      },
      -- moves
      {
        "]f", mode = { "n", "x", "o" }, function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
        desc = "Next function start",
      },
      {
        "]F", mode = { "n", "x", "o" }, function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
        end,
        desc = "Next function end",
      },
      {
        "[f", mode = { "n", "x", "o" }, function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
        desc = "Next function start",
      },
      {
        "[F", mode = { "n", "x", "o" }, function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
        end,
        desc = "Next function end",
      },
    },
    opts = {
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        selection_modes = {
          ["@function.outer"] = "V", -- linewise
          ["@function.inner"] = "V",
          ["@class.outer"] = "V",
          ["@class.inner"] = "V",
          ["@comment.inner"] = "V",
          ["@comment.outer"] = "V",
        },
      },
      move = {
        -- whether to set jumps in the jumplist
        set_jumps = true,
      },
    },
    config = function(opts)
      require("nvim-treesitter-textobjects").setup(opts)

      -- Setting them up outside of Lazy configuration, since it does not work
      -- properly: f, F keys are not configured properly

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      local ts_repeat_move =
        require "nvim-treesitter-textobjects.repeatable_move"
      vim.keymap.set(
        { "n", "x", "o" },
        ";",
        ts_repeat_move.repeat_last_move_next
      )
      vim.keymap.set(
        { "n", "x", "o" },
        ",",
        ts_repeat_move.repeat_last_move_previous
      )

      -- Make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set(
        { "n", "x", "o" },
        "f",
        ts_repeat_move.builtin_f_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "F",
        ts_repeat_move.builtin_F_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "t",
        ts_repeat_move.builtin_t_expr,
        { expr = true }
      )
      vim.keymap.set(
        { "n", "x", "o" },
        "T",
        ts_repeat_move.builtin_T_expr,
        { expr = true }
      )
    end,
  },
  {
    "shushtain/nvim-treesitter-incremental-selection",
    -- enabled = false,
    --stylua: ignore
    keys = {
      { "<c-space>", mode = { "n", "o" },
        function()
          require("nvim-treesitter-incremental-selection").init_selection()
        end,
      },
      { "<c-space>", mode = { "v" },
        function()
          require("nvim-treesitter-incremental-selection").increment_node()
        end,
      },
      { "<bs>", mode = { "v" },
        function()
          require("nvim-treesitter-incremental-selection").decrement_node()
        end,
      },
    },
    opts = {
      fallback = true,
    },
  },
}
