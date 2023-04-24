-- Disabled arrows keys to practice using other movements
-- Not as relevant today, but kept for history
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
-- vim.keymap.set("n", "<Down>", "<Nop>")
-- vim.keymap.set("n", "<Up>", "<Nop>")

-- Splitsmovement
-- Quickly move between panes
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")
vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")

-- Open new tab
vim.keymap.set("n", "<c-t>", "<cmd>tabnew<CR>")

-- Enable paste mode
vim.keymap.set("n", "<leader>p", "<cmd>set invpaste paste?<CR>")

-- Copy selection to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
