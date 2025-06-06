return {
  {
    "Bekaboo/dropbar.nvim",
    opts = {
      bar = {
        sources = function(buf, _)
          local sources = require "dropbar.sources"
          local utils = require "dropbar.utils"
          if vim.bo[buf].ft == "markdown" then
            return {
              sources.path,
              sources.markdown,
            }
          end
          if vim.bo[buf].buftype == "terminal" then
            return {
              sources.terminal,
            }
          end
          return {
            -- sources.path,
            utils.source.fallback {
              sources.lsp,
              sources.treesitter,
            },
          }
        end,
      },
    },
  },
}
