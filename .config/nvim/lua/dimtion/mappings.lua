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
vim.keymap.set("n", "<c-t>", "<cmd>tabnew<cr>", { desc = "Open new tab" })

-- Enable paste mode
vim.keymap.set(
  "n",
  "<leader>p",
  "<cmd>set invpaste paste?<cr>",
  { desc = "Enable paste mode" }
)

-- Copy selection to system clipboard
vim.keymap.set(
  { "n", "v" },
  "<leader>y",
  [["+y]],
  { desc = "Yank/copy selection to system clipboard" }
)
vim.keymap.set(
  "n",
  "<leader>Y",
  [["+Y]],
  { desc = "Yank/copy to system clipboard (linewise)" }
)

-- map p in visual mode replace the selected text with the yank register
-- Disabled as it does not work properly
-- vim.keymap.set("v", "p", [["_dP]], { noremap = true })

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

-- Insert the current date
vim.keymap.set("n", "<leader>it", function()
  vim.api.nvim_put({ os.date "%Y-%m-%d %H:%M:%S" }, "c", true, true)
end, { noremap = true, silent = true, desc = "Insert current timestamp" })

-- Autocmd to remove whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})
