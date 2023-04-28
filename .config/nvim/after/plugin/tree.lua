local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

tree.setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  view= {
    width = 50,
  },
})

vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeFindFileToggle<cr>", { silent = true, noremap = true })
