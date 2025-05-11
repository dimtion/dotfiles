return {
  "olimorris/codecompanion.nvim",
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ibhagwan/fzf-lua",
    "ravitemer/mcphub.nvim",
    "ravitemer/codecompanion-history.nvim",
  },
  keys = {
    {
      "<LocalLeader>w",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanionChat",
      noremap = true,
      silent = true,
      mode = { "n", "v" },
    },
  },
  opts = {
    strategies = {
      chat = {
        adapter = "owui",
      },
      inline = {
        adapter = "owui",
      },
      cmd = {
        adapter = "owui",
      },
    },
    adapters = {
      owui = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "cmd: echo $OWUI_URL",
            api_key = "cmd: echo $OWUI_API_KEY",
            chat_url = "/api/chat/completions",
            models_endpoint = "/api/models",
          },
          schema = {
            model = {
              default = "bedrock/claude-sonnet", -- define llm model to be used
            },
          },
        })
      end,
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
                dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
                -- Save all chats by default
                auto_save = true,
                -- Keymap to save the current chat manually
                save_chat_keymap = "sc",
            },
        },
    },
  },
}
