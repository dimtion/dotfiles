-- IDE style bread crumb
-- Disabled for now as I realized I don't use it much these days.
-- Keeping the config while I test without
return {
  {
    "Bekaboo/dropbar.nvim",
    enabled = false,
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
