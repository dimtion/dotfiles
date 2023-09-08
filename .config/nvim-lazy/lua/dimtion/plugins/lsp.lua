local setup_lsp = function(_, _opts)
  local lsp = require "lsp-zero"

  lsp.preset "minimal"

  local lspconfig = require "lspconfig"
  lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

  lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, opts)

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format { async = true }
    end, opts)

    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  end)

  lsp.setup()

  require("mason").setup {}
  require("mason-lspconfig").setup {
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
      "tsserver",
      "rust_analyzer",
      "pyright",
      "lua_ls",
    },
    handlers = {
      lsp.default_setup,
      lua_ls = function()
        local lua_opts = lsp.nvim_lua_ls()
        require("lspconfig").lua_ls.setup(lua_opts)
      end,
    },
  }

  local cmp = require "cmp"
  cmp.setup {
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = require("lspkind").cmp_format {
        mode = "symbol", -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
      },
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
          else
            cmp.confirm { select = true }
          end
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
    }, {
      { name = "path" },
    }),
  }

  vim.diagnostic.config {
    virtual_text = true,
  }
end

return {
  "VonHeikemen/lsp-zero.nvim",
  enabled = true,
  branch = "dev-v3",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "hrsh7th/cmp-nvim-lua" }, -- Required
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "onsails/lspkind.nvim" }, -- Icons

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = setup_lsp,
}
