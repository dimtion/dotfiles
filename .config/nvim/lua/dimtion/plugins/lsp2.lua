-- Default nvim shortcuts
-- gd -> goto definition
-- gra -> code action
-- grn -> renamed buffer
-- grr -> references
-- gri -> goto implementation
-- <C-S> -> signature
-- K -> Hover

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client == nil then
      return
    end
    if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "mason-org/mason.nvim",
    },
    keys = {
      { "gd", vim.lsp.buf.definition, desc = "Go to definition" },
      { "gD", vim.diagnostic.open_float, desc = "Open diagnostic" },
      {
        "<LocalLeader>ff",
        function()
          vim.lsp.buf.format { async = true }
        end,
        desc = "Format buffer (lsp)",
      },
      {
        "<LocalLeader>fd",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local diag = not vim.diagnostic.is_enabled {
            bufnr = bufnr,
          }
          vim.notify("Buffer LSP diagnostic enabled: " .. tostring(diag))

          vim.diagnostic.enable(diag, { bufnr = bufnr })
        end,
        mode = { "n" },
        desc = "Toggle buffer LSP diagnostic",
      },
      {
        "<Leader>li",
        "<cmd>LspInfo<cr>",
        desc = "LspInfo",
      },
      {
        "<Leader>lL",
        "<cmd>LspLog<cr>",
        desc = "Open Lsp Logs",
      },
      {
        "<Leader>ld",
        function()
          local diag = not vim.diagnostic.is_enabled()
          vim.notify("Global LSP diagnostic enabled: " .. tostring(diag))

          vim.diagnostic.enable(diag)
        end,
        mode = { "n" },
        desc = "Toggle global LSP diagnostic",
      },
    },
    config = function()
      local lspconfig = require "lspconfig"
    end,
  },
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = {
      {
        "<leader>lm",
        "<cmd>Mason<cr>",
        desc = "Open Mason (LSP package manager)",
      },
      { "<leader>lU", "<cmd>MasonUpdate<cr>", desc = "Update Mason packages" },
    },
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    cmd = "LazyDev",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
}
