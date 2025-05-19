return {
  "m4xshen/hardtime.nvim",
  -- enabled = false,
  -- dev = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "ibhagwan/fzf-lua",
  },
  opts = {
    restricted_keys = {
      ["<C-M>"] = {},
      ["<C-N>"] = {},
      ["<C-P>"] = {},
    },
    hints = {
      ["0w"] = {
        message = function()
          return "Use ^ instead of 0w"
        end,
        length = 2,
      },
      ["[dcyvV][ia][%(%)]"] = {
        message = function(keys) return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys end,
        length = 3,
      },
      ["[dcyvV][ia][%{%}]"] = {
        message = function(keys) return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys end,
        length = 3,
      },

      ["b[cd]t[\"']"] = {
        message = function(keys)
          return "Use " .. keys:sub(2, 2) .. "i" .. keys:sub(4, 4) .. " instead of " .. keys
        end,
        length = 4,
      },
    }
  },
}