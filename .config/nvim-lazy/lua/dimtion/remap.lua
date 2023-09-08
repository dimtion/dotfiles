-- Disabled arrows keys to practice using other movements
-- Not as relevant today, but kept for history
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")

-- Splitsmovement
-- Quickly move between panes
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")
vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")

-- Open new tab
vim.keymap.set("n", "<c-t>", "<cmd>tabnew<cr>", { desc = "Open new tab" })

-- Enable paste mode
vim.keymap.set("n", "<leader>p", "<cmd>set invpaste paste?<cr>", { desc = "Enable paste mode" })

-- Copy selection to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank/copy selection to system clipboard"})
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank/copy to system clipboard (linewise)"})

-- When doing `*` search, highlight the word under the cursor without moving
-- TODO: does not work well for [^\w] chars
vim.keymap.set("n", "*", function()
  vim.fn.setreg(
    "/",
    [[\V\<]] .. vim.fn.escape(vim.fn.expand "<cword>", [[/\]]) .. [[\>]]
  )
  vim.fn.histadd("/", vim.fn.getreg "/")
  vim.o.hlsearch = true
end)
