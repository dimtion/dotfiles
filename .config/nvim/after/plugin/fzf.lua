local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
  return
end

fzf.setup {
  "telescope",
  -- preview={default="down"}
  -- fzf_opts = {
  --   ['--preview-window'] = 'nohidden,down,50%',
  -- },
  winopts = {
    preview = {
      default = "builtin",
      vertical = "up:60%",
      horizontal = "right:70%",
      layout = "flex", -- Note: vertical is good for long lines
    },
  },
  previewers = {
    builtin = {
      extensions = {
        -- neovim terminal only supports `viu` block output
        ["png"] = { "viu", "-b" },
        ["jpg"] = { "viu", "-b" },
        ["jpeg"] = { "viu", "-b" },
      },
    },
  },
}

vim.keymap.set("n", "<c-p>", fzf.files, { silent = true })
vim.keymap.set("n", "<c-f>", fzf.grep, { silent = true })
vim.keymap.set("n", "<c-f><c-f>", fzf.live_grep_native, { silent = true })
vim.keymap.set("n", "<c-s>", fzf.lsp_live_workspace_symbols, { silent = true })
vim.keymap.set("n", "<leader>c", fzf.commands, { silent = true })
vim.keymap.set("n", "<leader>k", fzf.keymaps, { silent = true })
vim.keymap.set("v", "//", fzf.grep_visual, { silent = true })
