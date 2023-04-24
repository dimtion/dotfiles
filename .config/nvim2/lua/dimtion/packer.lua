-- This file can be loaded by calling `lua require('dimtion/packer')` from init.vim
--
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
-- :PackerCompile
--
-- Remove any disabled or unused plugins
-- :PackerClean
--
-- Clean, then install missing plugins
-- :PackerInstall
--
-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
-- :PackerUpdate
--
-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
-- :PackerSync
--
-- Show list of installed plugins
-- :PackerStatus
--
-- TODO: See how not to load that file at startup to save time

-- Automatically bootstrap packer on a new machine
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data"
    .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Lib
  use "nvim-lua/plenary.nvim"

  -- Theme
  use "chriskempson/base16-vim"
  use { "rose-pine/neovim", as = "rose-pine" }

  -- Follow system dark/light theme using SIGWING
  -- use {
  --   "will/bgwinch.nvim",
  --   config = function() require("bgwinch").setup() end,
  -- }
  --
  use "vimpostor/vim-lumen"
  use "nvim-tree/nvim-web-devicons"

  -- Git wrapper
  use "tpope/vim-fugitive"
  -- use 'mhinz/vim-signify'
  use "lewis6991/gitsigns.nvim"

  -- Show undo tree
  use "mbbill/undotree"

  -- See: https://editorconfig.org/
  use "editorconfig/editorconfig-vim"

  -- TODO: configure, could be replaced by tree-sitter?
  use "preservim/nerdcommenter"

  -- TODO: configure
  use "easymotion/vim-easymotion"

  -- TODO: configure
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } },
    disable = true,
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    after = "nvim-telescope/telescope.nvim",
    disable = true,
  }

  use {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "nvim-tree/nvim-web-devicons" },
  }

  -- Tree-sitter
  --
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/nvim-treesitter-context"

  use {
    "numToStr/Comment.nvim",
  }

  -- LSP
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
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
  }

  -- Zen mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
