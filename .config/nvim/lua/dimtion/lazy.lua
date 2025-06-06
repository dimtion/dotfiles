-- lazy.nvim: package manager
-- Open with :Lazy

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup to use plugins folder
local work, _ = pcall(require, "work")
require("lazy").setup {
  spec = {
    { import = "dimtion/plugins" },
    (work and { import = "work/plugins" }) or nil,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  dev = {
    path = "~/src/",
  },
}
