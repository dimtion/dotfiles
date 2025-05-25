--- Single hotkey to open/switch/close nvim-tree
local nvimTreeFocusOrToggle = function()
  local nvimTree = require "nvim-tree.api"
  local currentBuf = vim.api.nvim_get_current_buf()
  local currentBufFt =
    vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
  if currentBufFt == "NvimTree" then
    nvimTree.tree.toggle()
  else
    nvimTree.tree.focus()
    nvimTree.tree.find_file { buf = currentBuf }
  end
end

--- Make :bd and :q behave as usual when tree is visible
vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
  nested = false,
  callback = function(e)
    local tree = require("nvim-tree.api").tree

    -- Nothing to do if tree is not opened
    if not tree.is_visible() then
      return
    end

    -- How many focusable windows do we have? (excluding e.g. incline status window)
    local winCount = 0
    for _, winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- We want to quit and only one window besides tree is left
    if e.event == "QuitPre" and winCount == 2 then
      vim.api.nvim_cmd({ cmd = "qall" }, {})
    end

    -- :bd was probably issued an only tree window is left
    -- Behave as if tree was closed (see `:h :bd`)
    if e.event == "BufEnter" and winCount == 1 then
      -- Required to avoid "Vim:E444: Cannot close last window"
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last buffer used before closing
        tree.toggle { find_file = true, focus = true }
        -- re-open nivm-tree
        tree.toggle { find_file = true, focus = false }
      end, 10)
    end
  end,
})

return {
  {
    "nvim-tree/nvim-tree.lua",
    -- enabled = false,
    lazy = false, -- according to plugin owner lazy load is not deterministic
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sort_by = "case_sensitive",
      renderer = {
        group_empty = true,
      },
      live_filter = {
        always_show_folders = false,
      },
      view = {
        width = 50,
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function edit_or_open()
          local node = api.tree.get_node_under_cursor()

          if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
          else
            -- open file
            api.node.open.edit()
            -- Close the tree if file was opened
            api.tree.close()
          end
        end

        local function collapse_parent()
          local node = api.tree.get_node_under_cursor()

          if node.nodes ~= nil then
            api.node.edit()
          else
            api.node.navigate.parent_close()
          end
        end

        -- Preview node
        local function preview()
          local node = api.tree.get_node_under_cursor()
          api.node.open.edit()
          if node.nodes ~= nil then
            -- expand or collapse folder
          else
            api.tree.focus()
          end
        end

        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "l", edit_or_open, opts "Edit Or Open")
        vim.keymap.set("n", "L", preview, opts "Vsplit Preview")
        vim.keymap.set("n", "h", collapse_parent, opts "Collapse Parent")
        vim.keymap.set("n", "H", api.tree.collapse_all, opts "Collapse All")
      end,
    },
    keys = {
      {
        "<leader>ft",
        nvimTreeFocusOrToggle,
        silent = true,
        noremap = true,
        desc = "Toggle file tree",
      },
      {
        "<c-a>",
        nvimTreeFocusOrToggle,
        silent = true,
        noremap = true,
        desc = "Toggle nvim-tree for current buffer",
      },
    },
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
}
