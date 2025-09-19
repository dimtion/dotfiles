return {
  {
    "nvim-neotest/neotest",
    keys = {
      {
        "goa",
        function()
          require("neotest").run.run { suite = true }
        end,
        desc = "Run all tests",
      },
      {
        "gor",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "god",
        function()
          require("neotest").run.run { strategy = "dap" }
        end,
        desc = "Debug nearest test",
      },
      {
        "gof",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run file",
      },
      {
        "goj",
        function()
          require("neotest").jump.prev { status = "failed" }
        end,
        desc = "Previous failed test",
      },
      {
        "gok",
        function()
          require("neotest").jump.next { status = "failed" }
        end,
        desc = "Next failed test",
      },
      {
        "goo",
        function()
          require("neotest").output.open { enter = true }
        end,
        desc = "Output of nearest test",
      },
      {
        "gop",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle raw output panel",
      },
      {
        "got",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle summary",
      },
    },
    opts = function()
      return {
        adapters = {
          require "rustaceanvim.neotest",
        },
      }
    end,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "andythigpen/nvim-coverage",
    },
  },
  {
    "andythigpen/nvim-coverage",
    lazy = true,
    -- version = "*",
    config = function()
      require("coverage").setup {
        auto_reload = true,
      }
    end,
  },
}
