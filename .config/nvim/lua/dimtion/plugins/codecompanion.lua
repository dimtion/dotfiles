return {
  "olimorris/codecompanion.nvim",
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ibhagwan/fzf-lua",
    "ravitemer/mcphub.nvim",
    "ravitemer/codecompanion-history.nvim",
    "j-hui/fidget.nvim",
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
    "CodeCompanionCmd",
    "CodeCompanionHistory",
  },
  keys = {
    {
      "<leader>aa",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanionChat",
      noremap = true,
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<cr>",
      desc = "Trigger inline Codecompanion",
      noremap = true,
      silent = true,
      mode = { "n", "v" },
    },
  },
  opts = {
    strategies = {
      chat = {
        adapter = "owui",
        slash_commands = {
          ["buffer"] = {
            keymaps = {
              modes = {
                i = "<C-b>",
                n = { "<localleader>ab" },
              },
            },
          },
          ["file"] = {
            keymaps = {
              modes = {
                n = { "<localleader>af" },
              },
            },
          },
        },
      },
      inline = {
        adapter = "owui",
      },
      cmd = {
        adapter = "owui",
      },
    },
    adapters = {
      http = {
        owui = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "cmd: cat ~/.config/sops-nix/secrets/oai/url",
              api_key = "cmd: cat ~/.config/sops-nix/secrets/oai/key",
              chat_url = "/api/chat/completions",
              models_endpoint = "/api/models",
            },
            schema = {
              model = {
                default = "bedrock/claude-sonnet-4",
              },
            },
          })
        end,
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
      history = {
        enabled = true,
        opts = {
          -- Keymap to open history from chat buffer (default: gh)
          keymap = "gh",
          -- Automatically generate titles for new chats
          auto_generate_title = true,
          ---On exiting and entering neovim, loads the last chat on opening chat
          continue_last_chat = false,
          ---When chat is cleared with `gx` delete the chat from history
          delete_on_clearing_chat = false,
          -- Picker interface ("telescope" or "snacks" or "default")
          picker = "default",
          ---Enable detailed logging for history extension
          enable_logging = false,
          ---Directory path to save the chats
          dir_to_save = vim.fn.stdpath "data" .. "/codecompanion-history",
          -- Save all chats by default
          auto_save = true,
          -- Keymap to save the current chat manually
          save_chat_keymap = "sc",
        },
      },
    },
  },
  init = function()
    require("dimtion.plugins.codecompanion.fidget-spinner"):init()
    require("dimtion.plugins.codecompanion.inline-extmark"):setup()
  end,
}
