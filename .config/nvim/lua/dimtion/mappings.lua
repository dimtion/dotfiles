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

-- Open buffer
vim.keymap.set("n", "<c-t>", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<c-s>", "<cmd>split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "<c-v>", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- Enable paste mode
vim.keymap.set(
  "n",
  "<localleader>xp",
  "<cmd>set invpaste paste?<cr>",
  { desc = "Toggle paste mode" }
)

-- Copy selection to system clipboard
vim.keymap.set(
  { "n", "v" },
  "<localleader>y",
  [["+y]],
  { desc = "Yank to system clipboard (selection)" }
)
vim.keymap.set(
  "n",
  "<localleader>Y",
  [["+Y]],
  { desc = "Yank to system clipboard (linewise)" }
)

-- Yank filepath to the system clipboard
vim.keymap.set(
  "n",
  "<LocalLeader>fp",
  "<cmd>let @+=expand('%:p')<cr>",
  { desc = "Yank absolute buffer path to clipboard" }
)

vim.keymap.set(
  "n",
  "<LocalLeader>fP",
  "<cmd>let @+=expand('%')<cr>",
  { desc = "Yank relateive buffer path to clipboard" }
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
vim.keymap.set("n", "<localleader>it", function()
  vim.api.nvim_put({ os.date "%Y-%m-%d %H:%M:%S" }, "c", true, true)
end, { noremap = true, silent = true, desc = "Insert current timestamp" })

-- Autocmd to remove whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

-- New file
vim.keymap.set(
  "n",
  "<leader>fn",
  "<cmd>enew<cr>",
  { noremap = true, silent = true, desc = "New unnamed buffer" }
)
vim.keymap.set(
  "n",
  "<leader>fw",
  "<cmd>w<cr>",
  { noremap = true, silent = true, desc = "Buffer write" }
)
vim.keymap.set(
  "n",
  "<leader>fx",
  "<cmd>x<cr>",
  { noremap = true, silent = true, desc = "Buffer write and exit" }
)
